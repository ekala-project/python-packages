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
  version = "2.5.0";
  pyproject = true;

  __structuredAttrs = true;

  src = fetchFromGitHub {
    owner = "geopy";
    repo = "geopy";
    tag = finalAttrs.version;
    hash = "sha256-I+t8RnpC1hurL+fcwRssREzsSx9yGHEqVjzxqKX0efc=";
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
