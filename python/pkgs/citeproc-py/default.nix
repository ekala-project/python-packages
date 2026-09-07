{
  lib,
  fetchPypi,
  buildPythonPackage,
  setuptools,
  versioneer,
  rnc2rng,
  lxml,
}:

buildPythonPackage rec {
  pname = "citeproc-py";
  version = "0.11.1";
  pyproject = true;

  src = fetchPypi {
    pname = "citeproc_py";
    inherit version;
    hash = "sha256-8vmmTNmAcGoMrF3rdXnm+KzIfOAUBSDMnzAmLSDDUwc=";
  };

  build-system = [
    setuptools
    versioneer
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
