{
  lib,
  fetchPypi,
  buildPythonPackage,
  setuptools,
}:

buildPythonPackage (finalAttrs: {
  pname = "ratelimit";
  version = "2.2.1";
  pyproject = true;

  src = fetchPypi {
    inherit (finalAttrs) pname version;
    hash = "sha256-r4qbZLghUprKCeuvbY0nkQDXZvGekLUFmsanGMpt7kI=";
  };

  build-system = [ setuptools ];

  pythonImportsCheck = [ "ratelimit" ];

  meta = {
    description = "Python API Rate Limit Decorator";
    homepage = "https://github.com/tomasbasham/ratelimit";
    license = lib.licenses.mit;
  };
})
