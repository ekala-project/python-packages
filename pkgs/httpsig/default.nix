{
  lib,
  buildPythonPackage,
  fetchPypi,
  setuptools,
  setuptools-scm,
  pycryptodome,
  requests,
  six,
}:

buildPythonPackage rec {
  pname = "httpsig";
  version = "1.3.0";
  pyproject = true;

  src = fetchPypi {
    inherit pname version;
    hash = "sha256-cdbVAkYSnE98/sIPXlfjUdK4SS1jHMKqlnkUrPkfbOY=";
  };

  build-system = [
    setuptools
    setuptools-scm
  ];

  dependencies = [
    pycryptodome
    requests
    six
    setuptools
  ];

  pythonImportsCheck = [ "httpsig" ];

  meta = {
    description = "Sign HTTP requests with secure signatures";
    homepage = "https://github.com/ahknight/httpsig";
    license = lib.licenses.mit;
  };
}
