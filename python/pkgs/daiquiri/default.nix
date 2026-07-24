{
  lib,
  buildPythonPackage,
  fetchPypi,
  setuptools,
  setuptools-scm,
  python-json-logger,
}:

buildPythonPackage rec {
  pname = "daiquiri";
  version = "3.4.0";
  pyproject = true;

  src = fetchPypi {
    inherit pname version;
    hash = "sha256-yh0ywsCgbzYU/4A6h6wdUNYo2zTQv37ZffDKV2MyBU8=";
  };

  build-system = [
    setuptools
    setuptools-scm
  ];

  dependencies = [ python-json-logger ];

  pythonImportsCheck = [ "daiquiri" ];

  meta = {
    description = "Library to configure Python logging easily";
    homepage = "https://github.com/Mergifyio/daiquiri";
    license = lib.licenses.asl20;
  };
}
