{
  lib,
  buildPythonPackage,
  fetchFromGitHub,

  # build-system
  hatch-fancy-pypi-readme,
  hatch-vcs,
  hatchling,
}:

buildPythonPackage rec {
  pname = "structlog";
  version = "25.5.0";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "hynek";
    repo = "structlog";
    tag = version;
    hash = "sha256-dY18eZ7IEzP/eKR7d2CjpTRr2KfXy+YmeZMueHkLSQY=";
  };

  build-system = [
    hatch-fancy-pypi-readme
    hatch-vcs
    hatchling
  ];

  pythonImportsCheck = [ "structlog" ];

  meta = {
    description = "Painless structural logging";
    homepage = "https://github.com/hynek/structlog";
    license = lib.licenses.asl20;
  };
}
