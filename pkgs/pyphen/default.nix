{
  lib,
  fetchPypi,
  buildPythonPackage,
  flit-core,
}:

buildPythonPackage rec {
  pname = "pyphen";
  version = "0.17.2";
  pyproject = true;

  src = fetchPypi {
    inherit pname version;
    hash = "sha256-9gZHqcmzDsbFmRAJevgrxd0tNldrkY5EFI2LB+87SqM=";
  };

  build-system = [ flit-core ];

  pythonImportsCheck = [ "pyphen" ];

  meta = {
    description = "Module to hyphenate text";
    homepage = "https://github.com/Kozea/Pyphen";
    license = lib.licenses.lgpl21;
  };
}
