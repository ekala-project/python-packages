{
  lib,
  buildPythonPackage,
  fetchPypi,

  # build-system
  hatchling,
  hatch-vcs,

  # dependencies
  cachetools,
  chardet,
  colorama,
  filelock,
  packaging,
  platformdirs,
  pluggy,
  pyproject-api,
  virtualenv,
}:

buildPythonPackage (finalAttrs: {
  pname = "tox";
  version = "4.34.1";
  pyproject = true;

  src = fetchPypi {
    inherit (finalAttrs) pname version;
    hash = "sha256-7x6Cl0wvXqApVNWQ7guWf61QDDh5smTqGe+5pVTzzGA=";
  };

  build-system = [
    hatchling
    hatch-vcs
  ];

  dependencies = [
    cachetools
    chardet
    colorama
    filelock
    packaging
    platformdirs
    pluggy
    pyproject-api
    virtualenv
  ];

  pythonImportsCheck = [ "tox" ];

  meta = {
    description = "Generic virtualenv management and test command line tool";
    homepage = "https://github.com/tox-dev/tox";
    license = lib.licenses.mit;
    mainProgram = "tox";
  };
})
