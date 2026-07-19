{
  lib,
  buildPythonPackage,
  fetchPypi,

  # build-system
  hatchling,

  # dependencies
  click,
  incremental,
  jinja2,
}:

buildPythonPackage rec {
  pname = "towncrier";
  version = "25.8.0";
  pyproject = true;

  src = fetchPypi {
    inherit pname version;
    hash = "sha256-7vFtKfgxrVers64yoFZXOYZiGfHr+90pfTKJTrmUDrE=";
  };

  build-system = [ hatchling ];

  dependencies = [
    click
    incremental
    jinja2
  ];

  pythonImportsCheck = [ "towncrier" ];

  meta = {
    description = "Utility to produce useful, summarised news files";
    homepage = "https://github.com/twisted/towncrier/";
    license = lib.licenses.mit;
  };
}
