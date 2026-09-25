{
  lib,
  buildPythonPackage,
  fetchFromGitHub,
  hatchling,
  pytest-cov-stub,
  pyyaml,
}:

buildPythonPackage rec {
  pname = "tinydb";
  version = "4.9.0";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "msiemens";
    repo = "tinydb";
    tag = "v${version}";
    hash = "sha256-7YKqbBf+WrSVDZdPb6dT/22f5uggXy8uQ3lkxvWD5AI=";
  };

  build-system = [
    hatchling
  ];
  pythonImportsCheck = [ "tinydb" ];

  meta = {
    description = "Lightweight document oriented database written in Python";
    homepage = "https://tinydb.readthedocs.org/";
    license = lib.licenses.mit;
  };
}
