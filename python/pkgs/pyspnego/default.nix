{
  lib,
  buildPythonPackage,
  fetchPypi,
  setuptools,
  cryptography,
}:

buildPythonPackage (finalAttrs: {
  pname = "pyspnego";
  version = "0.12.4";
  pyproject = true;

  src = fetchPypi {
    inherit (finalAttrs) pname version;
    hash = "sha256-rLMU1spcnOh5lLHuu+LYtofg1WT51lCzBq+0yPnC/9U=";
  };

  build-system = [ setuptools ];

  dependencies = [ cryptography ];

  pythonImportsCheck = [ "spnego" ];

  meta = {
    description = "Python SPNEGO authentication library";
    homepage = "https://github.com/jborean93/pyspnego";
    license = lib.licenses.mit;
  };
})
