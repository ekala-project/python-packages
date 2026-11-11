{
  lib,
  buildPythonPackage,
  fetchFromGitHub,
  hatchling,
  pydantic,
  python-dotenv,
  typing-extensions,
  typing-inspection,
}:

buildPythonPackage (finalAttrs: {
  pname = "pydantic-settings";
  version = "2.16.2";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "pydantic";
    repo = "pydantic-settings";
    tag = "v${finalAttrs.version}";
    hash = "sha256-iLvh3tM5c4+TLRdBqFp+x23vgPd63OmU3RqDitZV9Lw=";
  };

  build-system = [ hatchling ];

  dependencies = [
    pydantic
    python-dotenv
    typing-extensions
    typing-inspection
  ];

  pythonImportsCheck = [ "pydantic_settings" ];

  meta = {
    description = "Settings management using pydantic";
    homepage = "https://github.com/pydantic/pydantic-settings";
    license = lib.licenses.mit;
  };
})
