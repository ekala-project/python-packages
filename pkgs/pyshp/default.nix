{
  lib,
  buildPythonPackage,
  fetchFromGitHub,
  hatchling,
}:

buildPythonPackage rec {
  pname = "pyshp";
  version = "3.0.3";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "GeospatialPython";
    repo = "pyshp";
    tag = version;
    hash = "sha256-LsiTJpcO6KYZb3D6ysBWimFS1zEr0vQ9E9cOcC1jdLo=";
  };

  build-system = [ hatchling ];

  pythonImportsCheck = [ "shapefile" ];

  meta = {
    description = "Python read/write support for ESRI Shapefile format";
    homepage = "https://github.com/GeospatialPython/pyshp";
    license = lib.licenses.mit;
  };
}
