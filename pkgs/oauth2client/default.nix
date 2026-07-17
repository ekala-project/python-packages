{
  lib,
  buildPythonPackage,
  fetchPypi,
  setuptools,
  six,
  httplib2,
  pyasn1-modules,
  rsa,
}:

buildPythonPackage rec {
  pname = "oauth2client";
  version = "4.1.3";
  pyproject = true;

  src = fetchPypi {
    inherit pname version;
    hash = "sha256-1IZ0HkUSh/aVaKTSbXDZrNc6K7+idXRsU1tCCYkczMY=";
  };

  build-system = [ setuptools ];

  dependencies = [
    six
    httplib2
    pyasn1-modules
    rsa
  ];

  pythonImportsCheck = [ "oauth2client" ];

  meta = {
    description = "OAuth 2.0 client library";
    homepage = "https://github.com/google/oauth2client/";
    license = lib.licenses.asl20;
  };
}
