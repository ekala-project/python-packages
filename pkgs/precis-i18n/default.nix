{
  lib,
  fetchPypi,
  buildPythonPackage,
  setuptools,
}:

buildPythonPackage rec {
  pname = "precis-i18n";
  version = "1.1.2";
  pyproject = true;

  src = fetchPypi {
    pname = "precis_i18n";
    inherit version;
    hash = "sha256-eO83v/eo+DdKplBAqsHO3NYL+Xv0qBE+5xPPcjAFF7k=";
  };

  build-system = [ setuptools ];

  doCheck = false;

  pythonImportsCheck = [ "precis_i18n" ];

  meta = {
    description = "Internationalized usernames and passwords";
    homepage = "https://github.com/byllyfish/precis_i18n";
    license = lib.licenses.mit;
  };
}
