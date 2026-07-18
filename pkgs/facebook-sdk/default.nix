{
  lib,
  buildPythonPackage,
  fetchPypi,

  # build-system
  setuptools,

  # dependencies
  requests,
}:

buildPythonPackage rec {
  pname = "facebook-sdk";
  version = "3.1.0";
  pyproject = true;

  src = fetchPypi {
    inherit pname version;
    hash = "sha256-yrzS5p6j2fBCkZyZs1PfeqHivobQQBIfbp9eY8HPD40=";
  };

  build-system = [ setuptools ];

  dependencies = [ requests ];

  pythonImportsCheck = [ "facebook" ];

  meta = {
    description = "Client library that supports the Facebook Graph API";
    homepage = "https://github.com/pythonforfacebook/facebook-sdk";
    license = lib.licenses.asl20;
  };
}
