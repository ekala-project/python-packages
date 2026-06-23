{
  lib,
  buildPythonPackage,
  fetchFromGitHub,

  # build-system
  hatch-vcs,
  hatchling,

  # dependencies
  wcwidth,
}:

buildPythonPackage rec {
  pname = "prettytable";
  version = "3.17.0";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "jazzband";
    repo = "prettytable";
    tag = version;
    hash = "sha256-MvKa6M2kfD3rUl+kxsD87ieBzmDtahoMQJUNWsofCBc=";
  };

  build-system = [
    hatch-vcs
    hatchling
  ];

  dependencies = [ wcwidth ];

  pythonImportsCheck = [ "prettytable" ];

  meta = {
    description = "Display tabular data in a visually appealing ASCII table format";
    homepage = "https://github.com/jazzband/prettytable";
    license = lib.licenses.bsd3;
  };
}
