{
  lib,
  buildPythonPackage,
  fetchFromGitHub,

  # build-system
  hatch-vcs,
  hatchling,

  # dependencies
  numpy,
  pandas,
  sortedcontainers,
}:

buildPythonPackage rec {
  pname = "pyannote-core";
  version = "6.0.1";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "pyannote";
    repo = "pyannote-core";
    tag = version;
    hash = "sha256-r5NkOAzrQGcb6LPi4/DA0uT9R0ELiYuwQkbT1l6R8Mw=";
  };

  build-system = [
    hatch-vcs
    hatchling
  ];

  dependencies = [
    numpy
    pandas
    sortedcontainers
  ];
  pythonImportsCheck = [ "pyannote.core" ];

  meta = {
    description = "Advanced data structures for handling temporal segments with attached labels";
    homepage = "https://github.com/pyannote/pyannote-core";
    license = lib.licenses.mit;
    maintainers = [ ];
  };
}
