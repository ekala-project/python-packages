{
  lib,
  buildPythonPackage,
  fetchPypi,
  # build-system
  setuptools,
}:

buildPythonPackage (finalAttrs: {
  pname = "types-toml";
  version = "0.10.8.20260518";
  pyproject = true;

  src = fetchPypi {
    pname = "types_toml";
    inherit (finalAttrs) version;
    hash = "sha256-gOEPrNJP3tqdXGchh9cr46woSEN4jWf1quWePgFttv4=";
  };

  build-system = [ setuptools ];

  # Module doesn't have tests

  pythonImportsCheck = [ "toml-stubs" ];

  meta = {
    description = "Typing stubs for toml";
    homepage = "https://github.com/python/typeshed";
    license = lib.licenses.asl20;
  };
})
