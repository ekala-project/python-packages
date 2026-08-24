{ lib
, buildPythonPackage
, fetchFromGitHub
, hatch-fancy-pypi-readme
, hatch-vcs
, hatchling
,
}:

buildPythonPackage rec {
  pname = "pem";
  version = "23.1.0";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "hynek";
    repo = "pem";
    tag = version;
    hash = "sha256-rVYlnvISGugh9qvf3mdrIyELmeOUU4g6291HeoMkoQc=";
  };

  nativeBuildInputs = [
    hatchling
    hatch-fancy-pypi-readme
    hatch-vcs
  ];

  pythonImportsCheck = [ "pem" ];

  meta = {
    description = "Easy PEM file parsing in Python";
    homepage = "https://pem.readthedocs.io/";
    license = lib.licenses.mit;
    maintainers = [ ];
  };
}
