{
  lib,
  buildPythonPackage,
  fetchPypi,

  # build-system
  hatchling,
  hatch-vcs,
  hatch-fancy-pypi-readme,

  # dependencies
  distlib,
  filelock,
  packaging,
  platformdirs,
  python-discovery,
}:

buildPythonPackage (finalAttrs: {
  pname = "virtualenv";
  version = "21.15.6";
  pyproject = true;

  src = fetchPypi {
    inherit (finalAttrs) pname version;
    hash = "sha256-yLZcfSBspu8Y3pNSwWCz8E9m//n2sOyP0x8UaI66UsQ=";
  };

  build-system = [
    hatchling
    hatch-vcs
    hatch-fancy-pypi-readme
  ];

  pythonRelaxDeps = [
    "packaging"
    "python-discovery"
  ];

  dependencies = [
    distlib
    filelock
    packaging
    platformdirs
    python-discovery
  ];

  pythonImportsCheck = [ "virtualenv" ];

  meta = {
    description = "Tool to create isolated Python environments";
    homepage = "https://github.com/pypa/virtualenv";
    license = lib.licenses.mit;
    mainProgram = "virtualenv";
  };
})
