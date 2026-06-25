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
  version = "2.12.0";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "pydantic";
    repo = "pydantic-settings";
    tag = "v${version}";
    hash = "sha256-5SfF5Wfs/iLThd5xL/5C+qOQfg8s/9WUCSc5qag7CY0=";
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
