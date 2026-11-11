{
  lib,
  fetchPypi,
  buildPythonPackage,
  setuptools,
  six,
}:

buildPythonPackage (finalAttrs: {
  pname = "paste";
  version = "3.11.0";
  pyproject = true;

  src = fetchPypi {
    inherit (finalAttrs) pname version;
    hash = "sha256-yOlUAcvrgMNL+DKlzVF/uux0mSJbM0srJLpTmn9U464=";
  };

  build-system = [ setuptools ];

  dependencies = [
    setuptools
    six
  ];

  pythonImportsCheck = [ "paste" ];

  meta = {
    homepage = "https://pythonpaste.readthedocs.io/";
    description = "Tools for using a Web Server Gateway Interface stack";
    license = lib.licenses.mit;
  };
})
