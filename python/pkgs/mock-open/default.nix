{
  lib,
  fetchPypi,
  buildPythonPackage,
  setuptools,
}:

buildPythonPackage rec {
  pname = "mock-open";
  version = "1.4.0";
  pyproject = true;

  src = fetchPypi {
    inherit pname version;
    hash = "sha256-w+y2uMMqWJmk9b9ElQg7WYtSDGmLugDhzirObpwjkQA=";
  };

  build-system = [ setuptools ];

  pythonImportsCheck = [ "mock_open" ];

  meta = {
    homepage = "https://github.com/nivbend/mock-open";
    description = "Better mock for file I/O";
    license = lib.licenses.mit;
  };
}
