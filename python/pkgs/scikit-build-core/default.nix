{
  lib,
  buildPythonPackage,
  fetchFromGitHub,

  # build-system
  hatch-vcs,
  hatchling,
  cmake,

  # dependencies
  packaging,
  pathspec,

  # tests
  build,
}:

buildPythonPackage (finalAttrs: {
  pname = "scikit-build-core";
  version = "1.0.3";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "scikit-build";
    repo = "scikit-build-core";
    tag = "v${finalAttrs.version}";
    hash = "sha256-pEBdDXmg9wSrOBRTiUrVqdAcN5WEdHPIcGhpm3ze130=";
  };

  build-system = [
    hatch-vcs
    hatchling
  ];

  dependencies = [
    packaging
    pathspec
  ];
  # cmake is only used for tests
  dontUseCmakeConfigure = true;
  setupHooks = [
    ./append-cmakeFlags.sh
  ];

  disabledTestMarks = [
    "isolated"
    "network"
  ];
  pythonImportsCheck = [ "scikit_build_core" ];

  meta = {
    description = "Next generation Python CMake adaptor and Python API for plugins";
    homepage = "https://github.com/scikit-build/scikit-build-core";
    license = lib.licenses.asl20;
  };
})
