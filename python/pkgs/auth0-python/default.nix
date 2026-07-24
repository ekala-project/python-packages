{
  lib,
  aiohttp,
  aioresponses,
  buildPythonPackage,
  callee,
  cryptography,
  fetchFromGitHub,
  mock,
  poetry-core,
  poetry-dynamic-versioning,
  pyjwt,
  pyopenssl,
  requests,
  urllib3,
}:

buildPythonPackage rec {
  pname = "auth0-python";
  version = "4.13.0";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "auth0";
    repo = "auth0-python";
    tag = version;
    hash = "sha256-+3c4fj2lv+HFhl3bJ1p1qPq602AG4oMecqE+FMpvjhI=";
  };

  nativeBuildInputs = [
    poetry-core
    poetry-dynamic-versioning
  ];

  propagatedBuildInputs = [
    aiohttp
    cryptography
    pyjwt
    pyopenssl
    requests
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
