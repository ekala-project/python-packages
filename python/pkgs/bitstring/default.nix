{
  lib,
  fetchPypi,
  buildPythonPackage,
  setuptools,
  # dependencies
  tibs,
}:

buildPythonPackage (finalAttrs: {
  pname = "bitstring";
  version = "5.0.0";
  pyproject = true;

  src = fetchPypi {
    inherit (finalAttrs) pname version;
    hash = "sha256-Adh2tue72RK/o64dAo7UGe0hkyRf4jN/IdMK+qORwFM=";
  };

  build-system = [ setuptools ];

  dependencies = [ tibs ];

  pythonImportsCheck = [ "bitstring" ];

  meta = {
    description = "Module for binary data manipulation";
    homepage = "https://github.com/scott-griffiths/bitstring";
    license = lib.licenses.mit;
  };
})
