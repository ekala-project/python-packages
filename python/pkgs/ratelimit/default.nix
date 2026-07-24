{
  lib,
  fetchPypi,
  buildPythonPackage,
  setuptools,
}:

buildPythonPackage rec {
  pname = "ratelimit";
  version = "2.2.1";
  pyproject = true;

  src = fetchPypi {
    inherit pname version;
    hash = "sha256-r4qbZLghUprKCeuvbY0nkQDXZvGekLUFmsanGMpt7kI=";
  };

  build-system = [ setuptools ];

  pythonImportsCheck = [ "ratelimit" ];

  meta = {
    description = "Python API Rate Limit Decorator";
    homepage = "https://github.com/tomasbasham/ratelimit";
    license = lib.licenses.mit;
  };
}
