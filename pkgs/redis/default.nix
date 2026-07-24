{
  lib,
  buildPythonPackage,
  fetchFromGitHub,
  pythonOlder,

  # build-system
  hatchling,

  # dependencies
  async-timeout,

  # optional-dependencies
  pyjwt,
  cryptography,
  pyopenssl,
  requests,
}:

buildPythonPackage rec {
  pname = "redis";
  version = "8.0.1";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "redis";
    repo = "redis-py";
    tag = "v${version}";
    hash = "sha256-41i4oZmbWi87KBSaAAaZe2gPlCpgw6kEPne1IA3PHQM=";
  };

  build-system = [ hatchling ];

  dependencies = lib.optionals (pythonOlder "3.11") [
    async-timeout
  ];

  optional-dependencies = {
    jwt = [ pyjwt ];
    ocsp = [
      cryptography
      pyopenssl
      requests
    ];
  };

  pythonImportsCheck = [
    "redis"
    "redis.client"
    "redis.cluster"
    "redis.connection"
    "redis.exceptions"
    "redis.sentinel"
    "redis.utils"
  ];

  # Tests require a running redis
  doCheck = false;

  meta = {
    description = "Python client for Redis key-value store";
    homepage = "https://github.com/redis/redis-py";
    license = lib.licenses.mit;
  };
}
