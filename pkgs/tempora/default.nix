{
  lib,
  buildPythonPackage,
  fetchPypi,

  # build-system
  setuptools-scm,

  # dependencies
  jaraco-functools,
  python-dateutil,
}:

buildPythonPackage rec {
  pname = "tempora";
  version = "5.8.1";
  pyproject = true;

  src = fetchPypi {
    inherit pname version;
    hash = "sha256-q7XZ7HkMxeT5Qxd4Apuj49m6m9UMswba2CSCSys2Lc0=";
  };

  postPatch = ''
    sed -i "/coherent\.licensed/d" pyproject.toml
  '';

  build-system = [ setuptools-scm ];

  dependencies = [
    jaraco-functools
    python-dateutil
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
    license = lib.licenses.mit;
  };
}
