{
  lib,
  buildPythonPackage,
  fetchPypi,
  # build-system
  setuptools,
}:

buildPythonPackage (finalAttrs: {
  pname = "python-string-utils";
  version = "1.0.0";
  pyproject = true;

  src = fetchPypi {
    inherit (finalAttrs) pname version;
    hash = "sha256-3PkGCwPwdkfApgNAjciwP4B/O1SgXG4Z6xRGAlb6wMs=";
  };

  build-system = [ setuptools ];

  pythonImportsCheck = [ "string_utils" ];

  meta = {
    description = "Handy Python library to validate, manipulate and generate strings";
    homepage = "https://github.com/daveoncode/python-string-utils";
    license = lib.licenses.mit;
  };
})
