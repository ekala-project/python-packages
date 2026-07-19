{
  lib,
  fetchPypi,
  buildPythonPackage,
  poetry-core,
  pyyaml,
  typing-extensions,
}:

buildPythonPackage rec {
  pname = "confuse";
  version = "2.2.0";
  pyproject = true;

  src = fetchPypi {
    inherit pname version;
    hash = "sha256-NcG1PoG+El9EG+5TUTBVnJNZF7Jq6qYSiQEM0fVcK54=";
  };

  build-system = [ poetry-core ];

  dependencies = [
    pyyaml
    typing-extensions
  ];

  pythonImportsCheck = [ "confuse" ];

  meta = {
    description = "Python configuration library that uses YAML";
    homepage = "https://github.com/beetbox/confuse";
    license = lib.licenses.mit;
  };
}
