{
  lib,
  aiosmtplib,
  blinker,
  buildPythonPackage,
  cryptography,
  email-validator,
  fakeredis,
  fetchFromGitHub,
  httpx,
  jinja2,
  poetry-core,
  pydantic-settings,
  pydantic,
  pytest-asyncio,
  pytestCheckHook,
  redis,
  regex,
  starlette,
}:

buildPythonPackage (finalAttrs: {
  pname = "fastapi-mail";
  version = "1.6.8";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "sabuhish";
    repo = "fastapi-mail";
    tag = "v${finalAttrs.version}";
    hash = "sha256-KWwR/p3CFjQCLPa+TRFVLwVn+y5pqs7ZjRnce2f5B0U=";
  };

  pythonRelaxDeps = [
    "aiosmtplib"
    "cryptography"
    "email-validator"
    "regex"
    "pydantic"
  ];

  build-system = [ poetry-core ];

  dependencies = [
    aiosmtplib
    blinker
    cryptography
    email-validator
    fakeredis
    httpx
    jinja2
    pydantic
    pydantic-settings
    regex
    starlette
  ];

  optional-dependencies = {
    redis = [ redis ];
  };

  nativeCheckInputs = [
    pytest-asyncio
    pytestCheckHook
  ];

  disabledTests = [
    # Tests require access to /etc/resolv.conf
    "test_default_checker"
    "test_redis_checker"
    "test_local_hostname_resolving"
  ];

  pythonImportsCheck = [ "fastapi_mail" ];

  meta = {
    description = "Module for sending emails and attachments";
    homepage = "https://github.com/sabuhish/fastapi-mail";
    license = lib.licenses.mit;
    maintainers = [ ];
  };
})
