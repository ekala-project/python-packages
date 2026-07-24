{
  lib,
  buildPythonPackage,
  fetchFromGitHub,

  # build-system
  hatchling,

  # dependencies
  pytest,
  rich,

  # tests
}:

buildPythonPackage (finalAttrs: {
  pname = "pytest-pretty";
  version = "1.3.0";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "samuelcolvin";
    repo = "pytest-pretty";
    tag = "v${finalAttrs.version}";
    hash = "sha256-vJ75zpY0xlTQbi7qTHyqHZ7AMb7bLlM6SNq2b7zcQYs=";
  };

  build-system = [
    hatchling
  ];

  dependencies = [
    pytest
    rich
  ];

  pythonImportsCheck = [ "pytest_pretty" ];
  meta = {
    description = "Pytest plugin for pretty printing the test summary";
    homepage = "https://github.com/samuelcolvin/pytest-pretty";
    license = lib.licenses.mit;
    maintainers = [ ];
  };
})
