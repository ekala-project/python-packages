{
  lib,
  fetchPypi,
  buildPythonPackage,
  setuptools,
}:

buildPythonPackage rec {
  pname = "objgraph";
  version = "3.6.2";
  pyproject = true;

  src = fetchPypi {
    inherit pname version;
    hash = "sha256-ALny9A90IuPH9FphxNr9r4HwP/BknW6uyGbwEDDlGtg=";
  };

  build-system = [ setuptools ];

  pythonImportsCheck = [ "objgraph" ];

  doCheck = false;

  meta = {
    homepage = "https://mg.pov.lt/objgraph/";
    description = "Draws Python object reference graphs with graphviz";
    license = lib.licenses.mit;
  };
}
