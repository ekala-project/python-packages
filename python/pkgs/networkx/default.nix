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
  scipy,
  sympy,
}:

buildPythonPackage (finalAttrs: {
  pname = "networkx";
  version = "3.7";
  pyproject = true;

  src = fetchPypi {
    inherit (finalAttrs) pname version;
    hash = "sha256-/XelEb2Q8589AWNRNFtSz1MZuBO9ygHeP3VdPMpi6Wo=";
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
      sympy
    ];
  };

  meta = {
    homepage = "https://networkx.github.io/";
    downloadPage = "https://github.com/networkx/networkx";
    description = "Library for the creation, manipulation, and study of the structure, dynamics, and functions of complex networks";
    license = lib.licenses.bsd3;
  };
})
