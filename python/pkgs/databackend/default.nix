{
  lib,
  buildPythonPackage,
  fetchFromGitHub,
  pip-tools,
  setuptools-scm,
  setuptools,
}:

buildPythonPackage rec {
  pname = "databackend";
  version = "0.0.3";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "machow";
    repo = "databackend";
    tag = "v${version}";
    hash = "sha256-M5Nm33Vae6FDy4aurru4CeHjeNxyZZnqzpdkqNEvrm0=";
  };

  build-system = [
    setuptools
    setuptools-scm
  ];
  pythonImportsCheck = [ "databackend" ];

  meta = {
    description = "Module to register a subclass, without needing to import the subclass itself";
    homepage = "https://github.com/machow/databackend";
    license = lib.licenses.mit;
    maintainers = [ ];
  };
}
