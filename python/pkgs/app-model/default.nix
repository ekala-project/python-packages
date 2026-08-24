{
  lib,
  buildPythonPackage,
  fetchFromGitHub,
  hatch-vcs,
  hatchling,
  in-n-out,
  psygnal,
  pydantic,
  pydantic-compat,
  typing-extensions,
}:

buildPythonPackage (finalAttrs: {
  pname = "app-model";
  version = "0.5.1";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "pyapp-kit";
    repo = "app-model";
    tag = "v${finalAttrs.version}";
    hash = "sha256-zKaCxozT6OOPfrXMDic5d5DMb/I9tTiJFlX21Cc1yjY=";
  };

  build-system = [
    hatch-vcs
    hatchling
  ];

  dependencies = [
    psygnal
    pydantic
    pydantic-compat
    in-n-out
    typing-extensions
  ];

  pythonImportsCheck = [ "app_model" ];

  meta = {
    description = "Module to implement generic application schema";
    homepage = "https://github.com/pyapp-kit/app-model";
    license = lib.licenses.bsd3;
    maintainers = [ ];
  };
})
