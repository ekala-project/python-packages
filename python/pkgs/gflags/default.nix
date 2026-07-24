{
  lib,
  buildPythonPackage,
  fetchPypi,
  setuptools,
  six,
}:

buildPythonPackage rec {
  pname = "python-gflags";
  version = "3.1.2";
  pyproject = true;

  src = fetchPypi {
    inherit pname version;
    hash = "sha256-QK4THome9o6eFKpTygY4OcNPahaK/mIiF7W4dUkqHuI=";
  };

  build-system = [ setuptools ];

  dependencies = [ six ];

  pythonImportsCheck = [ "gflags" ];

  meta = {
    description = "Module for command line handling, similar to Google's gflags for C++";
    homepage = "https://github.com/google/python-gflags";
    license = lib.licenses.bsd3;
  };
}
