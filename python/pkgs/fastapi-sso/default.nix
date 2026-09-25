{
  lib,
  buildPythonPackage,
  email-validator,
  fastapi,
  fetchFromGitHub,
  httpx,
  oauthlib,
  poetry-core,
  pydantic,
  pyjwt,
}:

buildPythonPackage (finalAttrs: {
  pname = "fastapi-sso";
  version = "0.22.0";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "tomasvotava";
    repo = "fastapi-sso";
    tag = finalAttrs.version;
    hash = "sha256-dEyM/K0ljzFERMOth4Z9iQWnksbh98KybJ8kNJ5N7ic=";
  };

  build-system = [ poetry-core ];

  dependencies = [
    email-validator
    fastapi
    httpx
    oauthlib
    pydantic
    pyjwt
  ];
  pythonImportsCheck = [ "fastapi_sso" ];

  meta = {
    description = "FastAPI plugin to enable SSO to most common providers (such as Facebook login, Google login and login via Microsoft Office 365 Account";
    homepage = "https://github.com/tomasvotava/fastapi-sso";
    license = lib.licenses.mit;
  };
})
