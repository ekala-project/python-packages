{
  lib,
  fetchPypi,
  buildPythonPackage,
  setuptools,
  six,
}:

buildPythonPackage rec {
  pname = "multipledispatch";
  version = "1.0.0";
  pyproject = true;

  src = fetchPypi {
    inherit pname version;
    hash = "sha256-XIOZFUZcaCBsPpxHM1eQghbCg4O0JTYeXRRFlL+Fp+A=";
  };

  build-system = [ setuptools ];

  dependencies = [ six ];

  pythonImportsCheck = [ "multipledispatch" ];

  meta = {
    homepage = "https://github.com/mrocklin/multipledispatch/";
    description = "Relatively sane approach to multiple dispatch in Python";
    license = lib.licenses.bsd3;
  };
}
