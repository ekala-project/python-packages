{
  lib,
  buildPythonPackage,
  fetchFromGitHub,
  # build-system
  hatch-fancy-pypi-readme,
  hatchling,
  # dependencies
  awkward-cpp,
  fsspec,
  numpy,
  packaging,
}:

buildPythonPackage (finalAttrs: {
  pname = "awkward";
  version = "2.13.0";
  pyproject = true;
  __structuredAttrs = true;

  src = fetchFromGitHub {
    owner = "scikit-hep";
    repo = "awkward";
    tag = "v${finalAttrs.version}";
    hash = "sha256-z6/OoWLB5VqNe7iciiemXFp+RnvCLHn4cOA6zS3t6BE=";
  };

  build-system = [
    hatch-fancy-pypi-readme
    hatchling
  ];

  dependencies = [
    awkward-cpp
    fsspec
    numpy
    packaging
  ];

  dontUseCmakeConfigure = true;

  pythonImportsCheck = [ "awkward" ];

  meta = {
    description = "Manipulate JSON-like data with NumPy-like idioms";
    homepage = "https://github.com/scikit-hep/awkward";
    license = lib.licenses.bsd3;
    maintainers = [ ];
  };
})
