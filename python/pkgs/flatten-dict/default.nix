{
  lib,
  buildPythonPackage,
  fetchPypi,
  poetry-core,
}:

buildPythonPackage rec {
  pname = "flatten_dict";
  version = "0.5.0";
  pyproject = true;

  src = fetchPypi {
    inherit pname version;
    hash = "sha256-yolmTQvJVS1SXudWcmtadVwX9ltb8j0KHweEHxgUKLc=";
  };

  build-system = [ poetry-core ];

  pythonImportsCheck = [ "flatten_dict" ];

  meta = {
    description = "Module for flattening and unflattening dict-like objects";
    homepage = "https://github.com/ianlini/flatten-dict";
    license = lib.licenses.mit;
  };
}
