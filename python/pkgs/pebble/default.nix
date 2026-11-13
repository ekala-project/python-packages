{
  lib,
  fetchPypi,
  buildPythonPackage,
  setuptools,
}:

buildPythonPackage (finalAttrs: {
  pname = "pebble";
  version = "5.2.3";
  pyproject = true;

  src = fetchPypi {
    inherit (finalAttrs) pname version;
    hash = "sha256-b86MyMvzZ1iEBvZuS2LsNuIllKbHIL/x0IzC5WWmavM=";
  };

  build-system = [ setuptools ];

  pythonImportsCheck = [ "pebble" ];

  meta = {
    description = "API to manage threads and processes within an application";
    homepage = "https://github.com/noxdafox/pebble";
    license = lib.licenses.lgpl3Plus;
  };
})
