{
  lib,
  buildPythonPackage,
  fetchFromGitHub,
  python,

  # build-system
  nanobind,
  ninja,
  scikit-build-core,

  # nativeBuildInputs
  cmake,
  pkg-config,
}:

buildPythonPackage rec {
  pname = "flaxlib";
  version = "0.0.1";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "google";
    repo = "flax";
    tag = "v0.12.7";
    hash = "sha256-a78KiTsCCARWZvbxz9QKdUKnjkDJGXcPVVJu5rU4m/U=";
  };

  sourceRoot = "${src.name}/flaxlib_src";

  dontUseCmakeConfigure = true;

  build-system = [
    nanobind
    ninja
    scikit-build-core
  ];
  nativeBuildInputs = [
    cmake
    pkg-config
  ];

  env.CMAKE_PREFIX_PATH = "${nanobind}/${python.sitePackages}/nanobind";

  pythonImportsCheck = [ "flaxlib" ];

  doCheck = false;

  meta = {
    description = "Rust library used internally by flax";
    homepage = "https://github.com/google/flax/tree/main/flaxlib";
    license = lib.licenses.asl20;
    maintainers = [ ];
  };
}
