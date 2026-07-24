{
  lib,
  stdenv,
  buildPythonPackage,
  fetchFromGitHub,
  replaceVars,
  gdb,
  lldb,
  setuptools,
}:

buildPythonPackage rec {
  pname = "debugpy";
  version = "1.8.21";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "microsoft";
    repo = "debugpy";
    tag = "v${version}";

    postFetch = ''
      sed -i 's/git_refnames = "[^"]*"/git_refnames = " (tag: ${src.tag})"/' "$out/src/debugpy/_version.py"
    '';

    hash = "sha256-7XM476tfL6QLCHB1kwlbN/dmlgnjuTE+ulQ9yOHfgEE=";
  };

  patches =
    lib.optionals stdenv.hostPlatform.isLinux [
      (replaceVars ./hardcode-gdb.patch {
        inherit gdb;
      })
    ]
    ++ lib.optionals stdenv.hostPlatform.isDarwin [
      (replaceVars ./hardcode-lldb.patch {
        inherit lldb;
      })
    ];

  preBuild = ''
    (
      set -x
      cd src/debugpy/_vendored/pydevd/pydevd_attach_to_process
      $CXX linux_and_mac/attach.cpp -Ilinux_and_mac -std=c++11 -fPIC -nostartfiles ${
        {
          "x86_64-linux" = "-shared -o attach_linux_amd64.so";
          "i686-linux" = "-shared -o attach_linux_x86.so";
          "aarch64-linux" = "-shared -o attach_linux_arm64.so";
          "riscv64-linux" = "-shared -o attach_linux_riscv64.so";
          "x86_64-darwin" = "-D_REENTRANT -dynamiclib -lc -o attach.dylib";
          "aarch64-darwin" = "-D_REENTRANT -dynamiclib -lc -o attach.dylib";
        }
        .${stdenv.hostPlatform.system} or (throw "Unsupported system: ${stdenv.hostPlatform.system}")
      }
    )
  '';

  build-system = [ setuptools ];

  pythonImportsCheck = [ "debugpy" ];

  meta = {
    description = "Implementation of the Debug Adapter Protocol for Python";
    homepage = "https://github.com/microsoft/debugpy";
    license = lib.licenses.mit;
    platforms = [
      "x86_64-linux"
      "i686-linux"
      "aarch64-linux"
      "x86_64-darwin"
      "aarch64-darwin"
      "riscv64-linux"
    ];
  };
}
