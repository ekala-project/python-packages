{
  lib,
  buildPythonPackage,
  fetchFromGitHub,
  hatchling,
  pydantic,
  python-dotenv,
}:

buildPythonPackage rec {
  pname = "pydantic-settings";
  version = "2.15.0";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "pydantic";
    repo = "pydantic-settings";
    tag = "v${version}";
    hash = "sha256-bVZ0KOQ+YA2n4HZ/G7A8fmgQJMtcACRdz587du/z1s4=";
  };

  build-system = [ hatchling ];

  dependencies = [
    pydantic
    python-dotenv
  ];

  pythonImportsCheck = [ "pydantic_settings" ];

  meta = {
    description = "Settings management using pydantic";
    homepage = "https://github.com/pydantic/pydantic-settings";
    license = lib.licenses.mit;
  };
}
