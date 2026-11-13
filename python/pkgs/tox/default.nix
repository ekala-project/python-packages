{
  lib,
  buildPythonPackage,
  fetchPypi,

  # build-system
  hatchling,
  hatch-vcs,
  hatch-fancy-pypi-readme,
  docutils,

  # dependencies
  cachetools,
  colorama,
  filelock,
  packaging,
  platformdirs,
  pluggy,
  pyproject-api,
  python-discovery,
  tomli-w,
  virtualenv,
}:

buildPythonPackage (finalAttrs: {
  pname = "tox";
  version = "4.67.13";
  pyproject = true;

  src = fetchPypi {
    inherit (finalAttrs) pname version;
    hash = "sha256-n3C0TKLjHZHY/i4pF/UFVUlQrcOWHA7nC7QtsW2QP2I=";
  };

  build-system = [
    hatchling
    hatch-vcs
    hatch-fancy-pypi-readme
    docutils
  ];

  pythonRelaxDeps = [
    "cachetools"
    "python-discovery"
  ];

  dependencies = [
    cachetools
    colorama
    filelock
    packaging
    platformdirs
    pluggy
    pyproject-api
    python-discovery
    tomli-w
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
