{
  lib,
  buildPythonPackage,
  fetchPypi,
  hatchling,
  packaging,
}:

buildPythonPackage rec {
  pname = "versioningit";
  version = "3.3.0";
  pyproject = true;

  src = fetchPypi {
    inherit pname version;
    hash = "sha256-uRrX1z5z0hIg5pVA8gIT8rcpofmzXATp4Tfq8o0iFNo=";
  };

  build-system = [ hatchling ];

  dependencies = [ packaging ];

  pythonImportsCheck = [ "versioningit" ];

  meta = {
    description = "Versioning It with your Version In Git";
    homepage = "https://github.com/jwodder/versioningit";
    license = lib.licenses.mit;
    maintainers = [ ];
  };
}
