{
  lib,
  buildPythonPackage,
  fetchPypi,

  # build-system
  setuptools,

  # dependencies
  sexpdata,
}:

buildPythonPackage rec {
  pname = "epc";
  version = "0.0.5";
  pyproject = true;

  src = fetchPypi {
    inherit pname version;
    hash = "sha256-oU0up0gXlVog6wCBLjpGMKEyiX602XZCAkDxFSwNfSU=";
  };

  build-system = [ setuptools ];

  dependencies = [ sexpdata ];

  pythonImportsCheck = [ "epc" ];

  meta = {
    description = "EPC (RPC stack for Emacs Lisp) implementation in Python";
    homepage = "https://github.com/tkf/python-epc";
    license = lib.licenses.gpl3;
  };
}
