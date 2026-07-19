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
  version = "1.3.0";
  pyproject = true;

  src = fetchPypi {
    inherit pname version;
    hash = "sha256-UZQC6sObzE+khIIYcva7GEl/t7bIEWcEeGfRdxTTs3k=";
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
