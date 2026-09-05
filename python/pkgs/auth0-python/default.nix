{
  lib,
  aiohttp,
  aioresponses,
  buildPythonPackage,
  callee,
  cryptography,
  fetchFromGitHub,
  httpx,
  mock,
  pydantic,
  pydantic-core,
  poetry-core,
  poetry-dynamic-versioning,
  pyjwt,
  requests,
  typing-extensions,
  urllib3,
}:

buildPythonPackage rec {
  pname = "auth0-python";
  version = "6.4.0";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "auth0";
    repo = "auth0-python";
    tag = version;
    hash = "sha256-T3JxjDbaM/33fzywHJs9mfj3Qn7/v/yzeK9IcMAL4ys=";
  };

  nativeBuildInputs = [
    poetry-core
    poetry-dynamic-versioning
  ];

  propagatedBuildInputs = [
    aiohttp
    cryptography
    httpx
    pydantic
    pydantic-core
    pyjwt
    requests
    typing-extensions
    urllib3
  ]
  ++ pyjwt.optional-dependencies.crypto;
  pythonRelaxDeps = [ "cryptography" ];
  pythonImportsCheck = [ "auth0" ];

  meta = {
    description = "Auth0 Python SDK";
    homepage = "https://github.com/auth0/auth0-python";
    license = lib.licenses.mit;
    maintainers = [ ];
  };
}
