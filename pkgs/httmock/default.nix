{
  lib,
  fetchPypi,
  buildPythonPackage,
  setuptools,
  requests,
}:

buildPythonPackage rec {
  pname = "httmock";
  version = "1.4.0";
  pyproject = true;

  src = fetchPypi {
    inherit pname version;
    hash = "sha256-ROr0u1nMZM1vXYv4cAtGqjCXzFZRubyFxSffvHF5L0E=";
  };

  build-system = [ setuptools ];

  dependencies = [ requests ];

  pythonImportsCheck = [ "httmock" ];

  meta = {
    homepage = "https://github.com/patrys/httmock";
    description = "Mocking library for requests";
    license = lib.licenses.asl20;
  };
}
