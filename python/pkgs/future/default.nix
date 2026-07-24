{
  lib,
  fetchPypi,
  buildPythonPackage,
  setuptools,
}:

buildPythonPackage rec {
  pname = "future";
  version = "1.0.0";
  pyproject = true;

  src = fetchPypi {
    inherit pname version;
    hash = "sha256-vSloMJMHhh7a4UWKT4pPNZjAO+Q7l1IQdq6/XZTAewU=";
  };

  build-system = [ setuptools ];

  pythonImportsCheck = [
    "future.builtins"
    "future.moves"
    "future.standard_library"
    "past.builtins"
  ];

  meta = {
    homepage = "https://python-future.org";
    description = "Clean single-source support for Python 3 and 2";
    license = lib.licenses.mit;
  };
}
