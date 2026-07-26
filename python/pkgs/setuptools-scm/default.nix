{
  lib,
  buildPythonPackage,
  fetchPypi,

  # build-system
  setuptools,

  # dependencies
  vcs-versioning,

  # optional-dependencies
  rich,
}:

buildPythonPackage rec {
  pname = "setuptools-scm";
  version = "10.0.5";
  pyproject = true;

  src = fetchPypi {
    pname = "setuptools_scm";
    inherit version;
    hash = "sha256-u7qP51RRbN79AX9EVnIXdebvlmK9eIf7Uq4mgT1IOMM=";
  };

  postPatch = null;

  build-system = [ setuptools ];

  dependencies = [
    setuptools
    vcs-versioning
  ];

  optional-dependencies = {
    rich = [ rich ];
  };

  pythonImportsCheck = [ "setuptools_scm" ];

  doCheck = false;

  setupHook = ./setup-hook.sh;

  meta = {
    homepage = "https://github.com/pypa/setuptools_scm/";
    description = "Handles managing your python package versions in scm metadata";
    license = lib.licenses.mit;
    maintainers = [ ];
  };
}
