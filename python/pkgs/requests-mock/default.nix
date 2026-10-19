{
  lib,
  fetchPypi,
  buildPythonPackage,
  setuptools,
  setuptools-scm,
  requests,
}:

buildPythonPackage (finalAttrs: {
  pname = "requests-mock";
  version = "1.12.1";
  pyproject = true;

  src = fetchPypi {
    inherit (finalAttrs) pname version;
    hash = "sha256-6eEuMztSUVboKjyFLyIBa5FYIg0vR0VN6crop303FAE=";
  };

  build-system = [
    setuptools
    setuptools-scm
  ];

  dependencies = [ requests ];

  pythonImportsCheck = [ "requests_mock" ];

  meta = {
    homepage = "https://requests-mock.readthedocs.io";
    description = "Mock out responses from the requests package";
    license = lib.licenses.asl20;
  };
})
