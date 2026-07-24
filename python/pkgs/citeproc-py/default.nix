{
  lib,
  fetchPypi,
  buildPythonPackage,
  setuptools,
  rnc2rng,
  lxml,
}:

buildPythonPackage rec {
  pname = "citeproc-py";
  version = "0.10.2";
  pyproject = true;

  src = fetchPypi {
    pname = "citeproc_py";
    inherit version;
    hash = "sha256-GVZv5W1vt5GBizIgS1HEIkPCpLYPnm0xLpNxv+rH04E=";
  };

  build-system = [
    setuptools
    rnc2rng
  ];

  dependencies = [ lxml ];

  pythonImportsCheck = [ "citeproc" ];

  meta = {
    description = "Citation Style Language (CSL) parser for Python";
    homepage = "https://github.com/citeproc-py/citeproc-py";
    license = lib.licenses.bsd2;
  };
}
