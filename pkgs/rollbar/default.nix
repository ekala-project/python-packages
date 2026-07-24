{
  lib,
  fetchPypi,
  buildPythonPackage,
  setuptools,
  requests,
  six,
}:

buildPythonPackage rec {
  pname = "rollbar";
  version = "1.4.0";
  pyproject = true;

  src = fetchPypi {
    inherit pname version;
    hash = "sha256-mK1/kAEseR0LQOrFG2/miLHK3MSq3/dy/Aoj7+dftfw=";
  };

  build-system = [ setuptools ];

  dependencies = [
    requests
    six
  ];

  pythonImportsCheck = [ "rollbar" ];

  meta = {
    description = "Error tracking and logging from Python to Rollbar";
    homepage = "https://github.com/rollbar/pyrollbar";
    license = lib.licenses.mit;
  };
}
