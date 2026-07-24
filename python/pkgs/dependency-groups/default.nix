{
  lib,
  buildPythonPackage,
  fetchFromGitHub,
  flit-core,
  packaging,
  tomli,
}:

buildPythonPackage rec {
  pname = "dependency-groups";
  version = "1.3.1";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "pypa";
    repo = "dependency-groups";
    tag = version;
    hash = "sha256-suuSx3zf0Y45FJdH8Cb6N7hcvPnzleREpHhtdiG2CLg=";
  };

  build-system = [
    flit-core
  ];

  dependencies = [
    packaging
    tomli
  ];

  optional-dependencies = {
    cli = [
      tomli
    ];
  };
  pythonImportsCheck = [
    "dependency_groups"
  ];

  meta = {
    description = "A standalone implementation of PEP 735 Dependency Groups";
    homepage = "https://github.com/pypa/dependency-groups";
    license = lib.licenses.mit;
    maintainers = [ ];
  };
}
