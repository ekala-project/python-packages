{
  lib,
  buildPythonPackage,
  llvmPackages,
  hatchling,
  hatch-vcs,
}:

let
  libclang = llvmPackages.libclang;
in
buildPythonPackage {
  pname = "clang";
  pyproject = true;

  inherit (libclang) version src;

  postUnpack = ''
    # set source root to python bindings
    if [ -e "$sourceRoot/clang/bindings/python" ]; then
      # LLVM 13+ puts clang sources in subdirectory instead of plain tarball
      sourceRoot="$sourceRoot/clang/bindings/python"
    else
      sourceRoot="$sourceRoot/bindings/python"
    fi
  '';

  postPatch = ''
    # set passed libclang for runtime
    echo 'Config.set_library_path("${lib.getLib libclang}/lib")' >>./clang/cindex.py
  '';

  build-system = [
    hatchling
    hatch-vcs
  ];

  # the version comes from the llvmorg-* git tag
  env.SETUPTOOLS_SCM_PRETEND_VERSION = libclang.version;

  pythonImportsCheck = [ "clang.cindex" ];

  meta = libclang.meta // {
    description = "Python bindings for the C language family frontend for LLVM";
  };
}
