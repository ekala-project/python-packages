{
  lib,
  buildPythonPackage,
  fetchPypi,
  setuptools,
}:

buildPythonPackage (finalAttrs: {
  pname = "wurlitzer";
  version = "3.1.1";
  pyproject = true;

  src = fetchPypi {
    inherit (finalAttrs) pname version;
    hash = "sha256-v7kUSrnwJIfYArn/idvT+jgtCPc+EtuK3EwvsAzTm9k=";
  };

  build-system = [ setuptools ];

  pythonImportsCheck = [ "wurlitzer" ];

  meta = {
    description = "Capture C-level output in context managers";
    homepage = "https://github.com/minrk/wurlitzer";
    license = lib.licenses.mit;
  };
})
