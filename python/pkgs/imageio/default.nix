{
  lib,
  buildPythonPackage,
  fetchFromGitHub,

  # build-system
  setuptools,

  # dependencies
  numpy,
  pillow,
}:

buildPythonPackage rec {
  pname = "imageio";
  version = "2.37.4";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "imageio";
    repo = "imageio";
    tag = "v${version}";
    hash = "sha256-7UiKj/PH3eVa8Qa8zz5FJ2RmFHcL19THwSLY51tdy2I=";
  };

  build-system = [ setuptools ];

  dependencies = [
    numpy
    pillow
  ];

  pythonImportsCheck = [ "imageio" ];

  meta = {
    description = "Library for reading and writing a wide range of image, video, scientific, and volumetric data formats";
    homepage = "https://imageio.readthedocs.io";
    license = lib.licenses.bsd2;
  };
}
