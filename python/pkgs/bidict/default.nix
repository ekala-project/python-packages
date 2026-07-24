{
  lib,
  buildPythonPackage,
  fetchPypi,
  setuptools,
}:

buildPythonPackage rec {
  pname = "bidict";
  version = "0.23.1";
  pyproject = true;

  src = fetchPypi {
    inherit pname version;
    hash = "sha256-AwaddjvDh7vSDn1JkU51/EEypBk3+jQFQX4aWi0AbXE=";
  };

  build-system = [ setuptools ];

  doCheck = false;

  pythonImportsCheck = [ "bidict" ];

  meta = {
    description = "Bidirectional mapping library for Python";
    homepage = "https://bidict.readthedocs.io";
    license = lib.licenses.mpl20;
  };
}
