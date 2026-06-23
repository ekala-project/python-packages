{
  lib,
  buildPythonPackage,
  fetchPypi,

  # build-system
  setuptools,

  # optional-dependencies
  lxml,
  matplotlib,
  numpy,
  pandas,
  pydot,
  pygraphviz,
  scipy,
  sympy,
}:

buildPythonPackage rec {
  pname = "networkx";
  version = "3.6.1";
  pyproject = true;

  src = fetchPypi {
    inherit pname version;
    hash = "sha256-JrfDV6zMDIzeVYrUhig3KLZbapXYXuHNZrr6tMgWhQk=";
  };

  nativeBuildInputs = [ setuptools ];

  optional-dependencies = {
    default = [
      numpy
      scipy
      matplotlib
      pandas
    ];
    extra = [
      lxml
      pygraphviz
      pydot
      sympy
    ];
  };

  meta = {
    homepage = "https://networkx.github.io/";
    downloadPage = "https://github.com/networkx/networkx";
    description = "Library for the creation, manipulation, and study of the structure, dynamics, and functions of complex networks";
    license = lib.licenses.bsd3;
  };
}
