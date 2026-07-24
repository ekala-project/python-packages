{
  lib,
  buildPythonPackage,
  docutils,
  fetchFromGitHub,
  setuptools,
  geographiclib,
  pythonAtLeast,
  pytz,
}:

buildPythonPackage (finalAttrs: {
  pname = "geopy";
  version = "2.4.1";
  pyproject = true;

  __structuredAttrs = true;

  src = fetchFromGitHub {
    owner = "geopy";
    repo = "geopy";
    tag = finalAttrs.version;
    hash = "sha256-mlOXDEtYry1IUAZWrP2FuY/CGliUnCPYLULnLNN0n4Y=";
  };

  build-system = [ setuptools ];

  dependencies = [ geographiclib ];
  disabledTestPaths = lib.optionals (pythonAtLeast "3.12") [ "test/test_init.py" ];
  pythonImportsCheck = [ "geopy" ];
  meta = {
    homepage = "https://github.com/geopy/geopy";
    description = "Python Geocoding Toolbox";
    license = lib.licenses.mit;
    maintainers = [ ];
  };
})
