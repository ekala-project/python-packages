{
  lib,
  buildPythonPackage,
  fetchFromGitHub,
  hatchling,
  hatch-vcs,
}:

buildPythonPackage rec {
  pname = "isort";
  version = "7.0.0";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "PyCQA";
    repo = "isort";
    tag = version;
    hash = "sha256-GN76dLk+Ju+Do/BymIuHD/9KAjYZ3sKvfz2cvNEnF5U=";
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
