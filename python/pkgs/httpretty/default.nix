{
  lib,
  fetchPypi,
  buildPythonPackage,
  setuptools,
}:

buildPythonPackage (finalAttrs: {
  pname = "httpretty";
  version = "1.1.4";
  pyproject = true;

  src = fetchPypi {
    inherit (finalAttrs) pname version;
    hash = "sha256-IN4OXdWhgpLTbZKMw9blL4sqxz2uxA1B62Le4VSTO2g=";
  };

  build-system = [ setuptools ];

  pythonImportsCheck = [ "httpretty" ];

  meta = {
    homepage = "https://httpretty.readthedocs.org/";
    description = "HTTP client request mocking tool";
    license = lib.licenses.mit;
  };
})
