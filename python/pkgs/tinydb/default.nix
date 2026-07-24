{
  lib,
  buildPythonPackage,
  fetchFromGitHub,
  poetry-core,
  pytest-cov-stub,
  pyyaml,
}:

buildPythonPackage rec {
  pname = "tinydb";
  version = "4.8.2";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "msiemens";
    repo = "tinydb";
    tag = "v${version}";
    hash = "sha256-N/45XB7ZuZiq25v6DQx4K9NRVnBbUHPeiKKbxQ9YB3E=";
  };

  build-system = [
    poetry-core
  ];
  pythonImportsCheck = [ "tinydb" ];

  meta = {
    description = "Lightweight document oriented database written in Python";
    homepage = "https://tinydb.readthedocs.org/";
    license = lib.licenses.mit;
    maintainers = [ ];
  };
}
