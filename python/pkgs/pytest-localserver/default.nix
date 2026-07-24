{
  lib,
  buildPythonPackage,
  fetchPypi,

  # build-system
  setuptools-scm,

  # dependencies
  werkzeug,
}:

buildPythonPackage rec {
  pname = "pytest-localserver";
  version = "0.10.0";
  pyproject = true;

  src = fetchPypi {
    pname = "pytest_localserver";
    inherit version;
    hash = "sha256-JgcZfzkJEqslUl0SmsQ8PIdQSSVzaLP+CbXNA9zFJq8=";
  };

  build-system = [ setuptools-scm ];

  dependencies = [ werkzeug ];

  pythonImportsCheck = [ "pytest_localserver" ];

  meta = {
    description = "Plugin for the pytest testing framework to test server connections locally";
    homepage = "https://github.com/pytest-dev/pytest-localserver";
    license = lib.licenses.mit;
  };
}
