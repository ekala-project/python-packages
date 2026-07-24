{
  lib,
  stdenv,
  buildPythonPackage,
  fetchPypi,
  fontconfig,
  graphviz,
  mock,
  pycodestyle,
  pygraphviz,
  setuptools,
  six,
}:

buildPythonPackage rec {
  pname = "transitions";
  version = "0.9.3";
  pyproject = true;

  src = fetchPypi {
    inherit pname version;
    hash = "sha256-iB+3W7FlTtVdhgYLsGfyxxb44VX1e7c/1ETlNxOq/sg=";
  };

  build-system = [ setuptools ];

  dependencies = [
    six
    pygraphviz # optional
  ];
  pythonImportsCheck = [ "transitions" ];

  meta = {
    homepage = "https://github.com/pytransitions/transitions";
    description = "Lightweight, object-oriented finite state machine implementation in Python";
    license = lib.licenses.mit;
    maintainers = [ ];
  };
}
