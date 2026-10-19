{
  lib,
  buildPythonPackage,
  fetchPypi,
  setuptools,
  setuptools-scm,
  certifi,
}:

buildPythonPackage (finalAttrs: {
  pname = "twitter";
  version = "2.0a2";
  pyproject = true;

  src = fetchPypi {
    inherit (finalAttrs) pname version;
    hash = "sha256-CzjsEI184ruO48kOHVbrexkZgJ01gKTq/5gkjvTNmqc=";
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
})
