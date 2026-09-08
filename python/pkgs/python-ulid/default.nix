{
  lib,
  buildPythonPackage,
  fetchFromGitHub,
  hatch-fancy-pypi-readme,
  hatch-vcs,
  hatchling,
  pydantic,
  freezegun,
}:

buildPythonPackage rec {
  pname = "python-ulid";
  version = "4.0.1";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "mdomke";
    repo = "python-ulid";
    tag = version;
    hash = "sha256-U53hfviygdp6S+ZLXpLc0AeiAARfp3f5EBcCrufS2dA=";
  };

  build-system = [
    hatch-fancy-pypi-readme
    hatch-vcs
    hatchling
  ];

  optional-dependencies = {
    pydantic = [ pydantic ];
  };
  pythonImportsCheck = [ "ulid" ];

  meta = {
    description = "ULID implementation for Python";
    mainProgram = "ulid";
    homepage = "https://github.com/mdomke/python-ulid";
    license = lib.licenses.mit;
    maintainers = [ ];
  };
}
