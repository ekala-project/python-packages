{
  lib,
  buildPythonPackage,
  fetchFromGitHub,
  hatchling,
}:

buildPythonPackage rec {
  pname = "pyshp";
  version = "3.1.6";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "GeospatialPython";
    repo = "pyshp";
    tag = version;
    hash = "sha256-N4+GkxMtfa+EoZaGuun3ZhYMb3QHP2enMdq5MSw7M9g=";
  };

  build-system = [ hatchling ];

  pythonImportsCheck = [ "shapefile" ];

  meta = {
    description = "Python read/write support for ESRI Shapefile format";
    homepage = "https://github.com/GeospatialPython/pyshp";
    license = lib.licenses.mit;
  };
}
