{
  lib,
  buildPythonPackage,
  fetchPypi,
  cython,
  pdm-backend,
  setuptools,
}:

buildPythonPackage rec {
  pname = "editdistance";
  version = "0.8.1";
  pyproject = true;

  src = fetchPypi {
    inherit pname version;
    hash = "sha256-0c34Cl1QFLDJEmpppCzlWkV7RX9phv9pypjk/k0tj+0=";
  };

  build-system = [
    cython
    pdm-backend
    setuptools
  ];

  pythonImportsCheck = [ "editdistance" ];

  meta = {
    description = "Python implementation of the edit distance (Levenshtein distance)";
    homepage = "https://github.com/roy-ht/editdistance";
    license = lib.licenses.mit;
  };
}
