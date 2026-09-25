{
  lib,
  buildPythonPackage,
  cmake,
  cython,
  fetchFromGitHub,
  greenlet,
  ipython,
  jinja2,
  ninja,
  pkg-config,
  pkgconfig,
  pkgs,
  pytest-cov-stub,
  pytest-textual-snapshot,
  pythonOlder,
  rich,
  scikit-build-core,
  stdenv,
  textual,
}:

buildPythonPackage (finalAttrs: {
  pname = "memray";
  version = "1.20.0";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "bloomberg";
    repo = "memray";
    tag = "v${finalAttrs.version}";
    hash = "sha256-vllaJazm4sdQaJKd3FxiLl5JO8yWKvQnW2Lajhld37c=";
  };

  dontUseCmakeConfigure = true;

  build-system = [
    cmake
    cython
    ninja
    scikit-build-core
  ];
  nativeBuildInputs = [ pkg-config ];

  buildInputs = [
    pkgs.libunwind
    pkgs.lz4
  ]
  ++ lib.optionals stdenv.hostPlatform.isLinux [
    pkgs.elfutils # for `-ldebuginfod`
  ];

  dependencies = [
    pkgconfig
    textual
    jinja2
    rich
  ];
  pythonImportsCheck = [ "memray" ];
  meta = {
    description = "Memory profiler for Python";
    homepage = "https://bloomberg.github.io/memray/";
    license = lib.licenses.asl20;
    platforms = lib.platforms.linux ++ lib.platforms.darwin;
    mainProgram = "memray";
  };
})
