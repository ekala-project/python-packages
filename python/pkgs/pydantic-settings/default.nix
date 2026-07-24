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
  version = "2.14.2";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "pydantic";
    repo = "pydantic-settings";
    tag = "v${version}";
    hash = "sha256-7h0Jr/0qGJmve6fav9hKR1npDz29zD6Cci8h1TmuK4M=";
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
