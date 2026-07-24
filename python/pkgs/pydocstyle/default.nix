{
  lib,
  fetchPypi,
  buildPythonPackage,
  poetry-core,
  snowballstemmer,
}:

buildPythonPackage rec {
  pname = "pydocstyle";
  version = "6.3.0";
  pyproject = true;

  src = fetchPypi {
    inherit pname version;
    hash = "sha256-fOQ/DArIewdJTrnAtGLAtz5v8naAfyBNa1Ptxyt+ROE=";
  };

  build-system = [ poetry-core ];

  dependencies = [ snowballstemmer ];

  pythonImportsCheck = [ "pydocstyle" ];

  doCheck = false;

  meta = {
    homepage = "https://github.com/PyCQA/pydocstyle";
    description = "Python docstring style checker";
    license = lib.licenses.mit;
  };
}
