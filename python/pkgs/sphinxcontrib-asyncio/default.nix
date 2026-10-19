{
  lib,
  buildPythonPackage,
  fetchPypi,
  # build-system
  setuptools,
  sphinx,
}:

buildPythonPackage rec {
  pname = "sphinxcontrib-asyncio";
  version = "0.3.0";
  pyproject = true;

  src = fetchPypi {
    inherit pname version;
    hash = "sha256-mf0m4P5+34ckSnGpnDFv0Mm1CFbCUZrMqSfr50EAci4=";
  };

  build-system = [ setuptools ];

  dependencies = [ sphinx ];

  pythonImportsCheck = [ "sphinxcontrib.asyncio" ];

  pythonNamespaces = [ "sphinxcontrib" ];

  meta = {
    description = "Sphinx extension to add asyncio-specific markups";
    homepage = "https://github.com/aio-libs/sphinxcontrib-asyncio";
    license = lib.licenses.asl20;
  };
}
