{
  lib,
  buildPythonPackage,
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
  version = "0.21.1";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "tomasvotava";
    repo = "fastapi-sso";
    tag = finalAttrs.version;
    hash = "sha256-/5YuHLDYLnVQc/34OdlRTCJAVL2z6MZV8stSV/tpte4=";
  };

  build-system = [ poetry-core ];

  dependencies = [
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
    maintainers = [ ];
  };
})
