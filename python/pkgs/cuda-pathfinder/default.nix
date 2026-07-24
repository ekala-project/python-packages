{
  lib,
  buildPythonPackage,
  fetchFromGitHub,

  # build-system
  setuptools,
  setuptools-scm,

  # tests
  pytest-mock,
}:

buildPythonPackage (finalAttrs: {
  pname = "cuda-pathfinder";
  version = "1.5.6";
  pyproject = true;
  __structuredAttrs = true;

  src = fetchFromGitHub {
    owner = "NVIDIA";
    repo = "cuda-python";
    tag = "cuda-pathfinder-v${finalAttrs.version}";
    hash = "sha256-okhlkeS7vmH5nUFvND6stB5FoyGAsO1VimWRgFxqHKU=";
  };

  sourceRoot = "${finalAttrs.src.name}/cuda_pathfinder";

  build-system = [
    setuptools
    setuptools-scm
  ];

  pythonImportsCheck = [
    "cuda"
    "cuda.pathfinder"
  ];
  meta = {
    description = "one-stop solution for locating CUDA components";
    homepage = "https://github.com/NVIDIA/cuda-python/tree/main/cuda_pathfinder";
    license = lib.licenses.asl20;
    maintainers = [ ];
    platforms = lib.platforms.linux;
  };
})
