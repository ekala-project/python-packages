{
  lib,
  buildPythonPackage,
  cython,
  distutils,
  fetchFromGitHub,
  greenlet,
  ipython,
  jinja2,
  pkg-config,
  pkgconfig,
  pkgs,
  pytest-cov-stub,
  pytest-textual-snapshot,
  pythonOlder,
  rich,
  setuptools,
  stdenv,
  textual,
}:

buildPythonPackage (finalAttrs: {
  pname = "memray";
  version = "1.19.3";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "bloomberg";
    repo = "memray";
    tag = "v${finalAttrs.version}";
    hash = "sha256-A9XbVpuW/MlMNdFq5bbpg90GFh5c1aEWQOvGAOXyUgc=";
  };

  build-system = [
    distutils
    setuptools
  ];
  nativeBuildInputs = [ pkg-config ];

  buildInputs = [
    cython
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
    maintainers = [ ];
    platforms = lib.platforms.linux ++ lib.platforms.darwin;
    mainProgram = "memray";
  };
})
