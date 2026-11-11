{
  lib,
  fetchPypi,
  buildPythonPackage,
  setuptools,
  requests,
  six,
}:

buildPythonPackage (finalAttrs: {
  pname = "rollbar";
  version = "1.5.0";
  pyproject = true;

  src = fetchPypi {
    inherit (finalAttrs) pname version;
    hash = "sha256-GUCi4AeQHXAjAUvngqCYKOKCK4QqSw+QNIBs24Hgfww=";
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
})
