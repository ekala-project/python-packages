{
  lib,
  buildPythonPackage,
  fetchFromGitHub,
  pytest-mock,
  python-dotenv,
  pythonAtLeast,
  pytimeparse,
  pyyaml,
  setuptools,
  typing-extensions,
  tomli-w,
}:

buildPythonPackage rec {
  pname = "dataclass-wizard";
  version = "0.39.1";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "rnag";
    repo = "dataclass-wizard";
    tag = "v${version}";
    hash = "sha256-X4/qe1nv/NwUvQGvVqbqIgi9Ej43jwJjzXyMaKAtN2A=";
  };

  build-system = [ setuptools ];

  dependencies = [ typing-extensions ];

  optional-dependencies = {
    dotenv = [ python-dotenv ];
    timedelta = [ pytimeparse ];
    toml = [ tomli-w ];
    yaml = [ pyyaml ];
  };
  pythonImportsCheck = [ "dataclass_wizard" ];

  meta = {
    description = "Wizarding tools for interacting with the Python dataclasses module";
    homepage = "https://github.com/rnag/dataclass-wizard";
    license = lib.licenses.asl20;
    maintainers = [ ];
    mainProgram = "wiz";
  };
}
