{
  lib,
  buildPythonPackage,
  fetchPypi,

  # build-system
  setuptools,
}:

buildPythonPackage rec {
  pname = "iso-639";
  version = "0.4.5";
  pyproject = true;

  src = fetchPypi {
    pname = "iso-639";
    inherit version;
    hash = "sha256-3JzUuIC4mNd0xH/pd1FnQEr4qF3YidWPkAgDUQmszkk=";
  };

  build-system = [ setuptools ];

  dependencies = [ setuptools ];

  pythonImportsCheck = [ "iso639" ];

  meta = {
    description = "ISO 639 library for Python";
    homepage = "https://github.com/noumar/iso639";
    license = lib.licenses.agpl3Only;
  };
}
