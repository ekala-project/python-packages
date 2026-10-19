{
  lib,
  fetchPypi,
  buildPythonPackage,
  setuptools,
}:

buildPythonPackage (finalAttrs: {
  pname = "pbkdf2";
  version = "1.3";
  pyproject = true;

  src = fetchPypi {
    inherit (finalAttrs) pname version;
    hash = "sha256-rGOXNp8SghLEMGSitIeAONq3jatBh1NkVUqvKmhOaXk=";
  };

  build-system = [ setuptools ];

  pythonImportsCheck = [ "pbkdf2" ];

  meta = {
    homepage = "https://www.dlitz.net/software/python-pbkdf2/";
    description = "PBKDF2 password hashing";
    license = lib.licenses.mit;
  };
})
