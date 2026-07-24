{
  lib,
  buildPythonPackage,
  fetchPypi,
  setuptools,
  typing-extensions,
}:

buildPythonPackage rec {
  pname = "housekeeping";
  version = "1.1";
  pyproject = true;

  src = fetchPypi {
    inherit pname version;
    hash = "sha256-decfHMUBiFQG9r6BQQybBTYYcaPszN44kTNtoekkJrU=";
  };

  build-system = [ setuptools ];

  dependencies = [ typing-extensions ];

  pythonImportsCheck = [ "housekeeping" ];

  meta = {
    description = "Reusable deprecation helpers for Python projects";
    homepage = "https://github.com/beanbaginc/housekeeping";
    license = lib.licenses.mit;
  };
}
