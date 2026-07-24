{
  lib,
  fetchPypi,
  buildPythonPackage,
  setuptools,
}:

buildPythonPackage rec {
  pname = "pbkdf2";
  version = "1.3";
  pyproject = true;

  src = fetchPypi {
    inherit pname version;
    hash = "sha256-rGOXNp8SghLEMGSitIeAONq3jatBh1NkVUqvKmhOaXk=";
  };

  build-system = [ setuptools ];

  doCheck = false;

  pythonImportsCheck = [ "pbkdf2" ];

  meta = {
    homepage = "https://www.dlitz.net/software/python-pbkdf2/";
    description = "PBKDF2 password hashing";
    license = lib.licenses.mit;
  };
}
