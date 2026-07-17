{
  lib,
  fetchPypi,
  buildPythonPackage,
  setuptools,
}:

buildPythonPackage rec {
  pname = "graphviz";
  version = "0.21";
  pyproject = true;

  src = fetchPypi {
    inherit pname version;
    hash = "sha256-IHQ+cYO+gqqqitbJP4iTySO9ZligTDLuEV7bPIqDX3g=";
  };

  nativeBuildInputs = [ setuptools ];

  pythonImportsCheck = [ "graphviz" ];

  meta = {
    homepage = "https://github.com/xflr6/graphviz";
    description = "Simple Python interface for Graphviz";
    license = lib.licenses.mit;
  };
}
