{
  lib,
  fetchPypi,
  buildPythonPackage,
  setuptools,
  setuptools-scm,
  pytz,
}:

buildPythonPackage (finalAttrs: {
  pname = "pyrfc3339";
  version = "2.1.1";
  pyproject = true;

  src = fetchPypi {
    inherit (finalAttrs) pname version;
    hash = "sha256-sUTWOBm9TB6/nLV+EvTLpWf88j1ujy+Cm6nHgQ6kuVE=";
  };

  build-system = [
    setuptools
    setuptools-scm
  ];

  dependencies = [ pytz ];

  pythonImportsCheck = [ "pyrfc3339" ];

  meta = {
    homepage = "https://github.com/kurtraschke/pyRFC3339";
    description = "Generate and parse RFC 3339 timestamps";
    license = lib.licenses.mit;
  };
})
