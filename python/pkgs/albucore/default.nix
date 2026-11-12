{
  lib,
  buildPythonPackage,
  fetchFromGitHub,
  # build-system
  hatchling,
  # dependencies
  numkong,
  numpy,
  opencv-python,
  stringzilla,
}:

buildPythonPackage (finalAttrs: {
  pname = "albucore";
  version = "0.2.4";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "albumentations-team";
    repo = "albucore";
    tag = finalAttrs.version;
    hash = "sha256-BFxte0UHKUkC/vKqiCUHRAQQMM34VrNYdZCiKW4Hm6U=";
  };

  build-system = [
    hatchling
  ];

  dependencies = [
    numkong
    numpy
    opencv-python
    stringzilla
  ];

  pythonImportsCheck = [ "albucore" ];

  meta = {
    description = "High-performance image processing library to optimize and extend Albumentations with specialized functions for image transformations";
    homepage = "https://github.com/albumentations-team/albucore";
    license = lib.licenses.mit;
  };
})
