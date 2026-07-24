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
  version = "3.1.0";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "mdomke";
    repo = "python-ulid";
    tag = version;
    hash = "sha256-13yGd6vYnwzTi+KGJgoQ/z6Cy67FKVC4popaj2uPOlQ=";
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
