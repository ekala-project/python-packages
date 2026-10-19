{
  lib,
  arrow,
  buildPythonPackage,
  fetchFromGitHub,
  # build-system
  setuptools,
}:

buildPythonPackage (finalAttrs: {
  pname = "isoduration";
  version = "20.11.0";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "bolsote";
    repo = "isoduration";
    tag = finalAttrs.version;
    hash = "sha256-6LqsH+3V/K0s2YD1gvmelo+cCH+yCAmmyTYGhUegVdk=";
  };

  build-system = [ setuptools ];

  dependencies = [ arrow ];

  pythonImportsCheck = [ "isoduration" ];

  meta = {
    description = "Library for operations with ISO 8601 durations";
    homepage = "https://github.com/bolsote/isoduration";
    license = lib.licenses.isc;
  };
})
