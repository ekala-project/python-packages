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
  version = "0.9.0";
  pyproject = true;

  src = fetchPypi {
    pname = "citeproc_py";
    inherit version;
    hash = "sha256-WHgdilY+h8p8zrQ9CL6soQ3N+fPPd93zsXiUBx7cJ8g=";
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
