{
  lib,
  buildPythonPackage,
  fetchPypi,
  setuptools,
  setuptools-scm,
  certifi,
}:

buildPythonPackage rec {
  pname = "twitter";
  version = "1.19.6";
  pyproject = true;

  src = fetchPypi {
    inherit pname version;
    hash = "sha256-gN3WmuLuuIMT/u3uoxvxGf1ueVQe5bN6u5xD0jMZThA=";
  };

  build-system = [
    setuptools
    setuptools-scm
  ];

  dependencies = [ certifi ];

  pythonImportsCheck = [ "twitter" ];

  meta = {
    description = "Twitter API library";
    homepage = "https://mike.verdone.ca/twitter/";
    license = lib.licenses.mit;
  };
}
