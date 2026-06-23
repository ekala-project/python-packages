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
  pybreaker,
  hiredis,
  pyjwt,
  cryptography,
  pyopenssl,
  requests,
}:

buildPythonPackage rec {
  pname = "redis";
  version = "7.4.0";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "redis";
    repo = "redis-py";
    tag = "v${version}";
    hash = "sha256-alrfAYzjvoYsaA2NYVgI56f3R+5ed4CsA35ZmvXnk6k=";
  };

  build-system = [ hatchling ];

  dependencies = lib.optionals (pythonOlder "3.11") [
    async-timeout
  ];

  optional-dependencies = {
    circuit_breaker = [ pybreaker ];
    hiredis = [ hiredis ];
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
