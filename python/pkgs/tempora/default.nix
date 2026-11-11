{
  lib,
  buildPythonPackage,
  fetchPypi,

  # build-system
  flit-core,

  # dependencies
  jaraco-collections,
  jaraco-context,
  jaraco-functools,
  python-dateutil,
  typing-extensions,
}:

buildPythonPackage (finalAttrs: {
  pname = "tempora";
  version = "5.13.0";
  pyproject = true;

  src = fetchPypi {
    inherit (finalAttrs) pname version;
    hash = "sha256-Hm/gPYyczsVX5Y8YvzdD5sGnsJsyvNoHtzviM+9bJME=";
  };

  build-system = [ flit-core ];

  dependencies = [
    jaraco-collections
    jaraco-context
    jaraco-functools
    python-dateutil
    typing-extensions
  ];

  pythonImportsCheck = [
    "tempora"
    "tempora.schedule"
    "tempora.timing"
    "tempora.utc"
  ];

  meta = {
    homepage = "https://github.com/jaraco/tempora";
    description = "Objects and routines pertaining to date and time";
    mainProgram = "calc-prorate";
    license = lib.licenses.asl20;
  };
})
