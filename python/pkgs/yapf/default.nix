{
  lib,
  buildPythonPackage,
  fetchPypi,
  importlib-metadata,
  platformdirs,
  setuptools,
  tomli,
}:

buildPythonPackage (finalAttrs: {
  pname = "yapf";
  version = "0.43.0";
  pyproject = true;

  src = fetchPypi {
    inherit (finalAttrs) pname version;
    hash = "sha256-ANOqJL/t/5QgsuDV2fWrbZ1CaOcq+/Wbs/pUJ4HVIY4=";
  };

  build-system = [ setuptools ];

  dependencies = [
    importlib-metadata
    platformdirs
    tomli
  ];

  pythonImportsCheck = [ "yapf" ];

  meta = {
    description = "Yet Another Python Formatter";
    homepage = "https://github.com/google/yapf";
    license = lib.licenses.asl20;
  };
})
