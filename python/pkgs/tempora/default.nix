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

buildPythonPackage rec {
  pname = "tempora";
  version = "5.12.0";
  pyproject = true;

  src = fetchPypi {
    inherit pname version;
    hash = "sha256-tJt4zH7AslK/vXTO8BhxIbGOT1oMV+O5w9j8FQkK87Q=";
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
}
