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
  version = "26.1.0";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "hynek";
    repo = "structlog";
    tag = version;
    hash = "sha256-Q31eqeRYAbwn6Cj3hkXfy3udeBHHglEk5/qTjKbBbL8=";
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
