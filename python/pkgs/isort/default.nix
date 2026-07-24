{
  lib,
  buildPythonPackage,
  fetchFromGitHub,
  hatchling,
  hatch-vcs,
}:

buildPythonPackage rec {
  pname = "isort";
  version = "8.0.1";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "PyCQA";
    repo = "isort";
    tag = version;
    hash = "sha256-adEAWbRY+bCji4TfnS8W5p5KvuSjmLQrqhi+n8mSQPA=";
  };

  build-system = [
    hatchling
    hatch-vcs
  ];

  pythonImportsCheck = [ "isort" ];

  meta = {
    description = "Python utility / library to sort Python imports";
    homepage = "https://github.com/PyCQA/isort";
    license = lib.licenses.mit;
    mainProgram = "isort";
  };
}
