{
  lib,
  fetchPypi,
  buildPythonPackage,
  setuptools,
}:

buildPythonPackage rec {
  pname = "wasabi";
  version = "1.1.3";
  pyproject = true;

  src = fetchPypi {
    inherit pname version;
    hash = "sha256-S7MAjwA4CdsMPii02vIJBuqHGiu0P5kUGX1UD08uCHg=";
  };

  build-system = [ setuptools ];

  pythonImportsCheck = [ "wasabi" ];

  meta = {
    description = "Lightweight console printing and formatting toolkit";
    homepage = "https://github.com/explosion/wasabi";
    license = lib.licenses.mit;
  };
}
