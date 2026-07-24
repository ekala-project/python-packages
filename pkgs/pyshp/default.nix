{
  lib,
  buildPythonPackage,
  fetchFromGitHub,
  hatchling,
}:

buildPythonPackage rec {
  pname = "pyshp";
  version = "3.1.5";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "GeospatialPython";
    repo = "pyshp";
    tag = version;
    hash = "sha256-TX/KTIjspNrk+v4tmjSjoff1BM5+eOWumrqRIvfq1BI=";
  };

  build-system = [ hatchling ];

  pythonImportsCheck = [ "shapefile" ];

  meta = {
    description = "Python read/write support for ESRI Shapefile format";
    homepage = "https://github.com/GeospatialPython/pyshp";
    license = lib.licenses.mit;
  };
}
