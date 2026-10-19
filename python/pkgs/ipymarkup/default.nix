{
  lib,
  buildPythonPackage,
  fetchPypi,
  # build-system
  setuptools,
  intervaltree,
}:

buildPythonPackage rec {
  pname = "ipymarkup";
  version = "0.9.0";
  pyproject = true;

  src = fetchPypi {
    inherit pname version;
    hash = "sha256-P0v6EP1mKTIBr4SEp+a8tyO/LjPZpqoAiCZxr5yiaRE=";
  };

  build-system = [ setuptools ];

  dependencies = [ intervaltree ];
  pythonImportsCheck = [ "ipymarkup" ];

  # Upstream has no tests:

  meta = {
    description = "Collection of NLP visualizations for NER and syntax tree markup";
    homepage = "https://github.com/natasha/ipymarkup";
    license = lib.licenses.mit;
  };
}
