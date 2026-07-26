{ lib
, buildPythonPackage
, fetchFromGitHub
, # build-system
  setuptools
, # optional-dependencies
  redis
, aiomcache
, msgpack
,
}:

buildPythonPackage rec {
  pname = "aiocache";
  version = "0.12.3";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "aio-libs";
    repo = "aiocache";
    tag = "v${version}";
    hash = "sha256-4QYCRXMWlt9fsiWgUTc2pKzXG7AG/zGmd4HT5ggIZNM=";
  };

  build-system = [ setuptools ];

  optional-dependencies = {
    redis = [ redis ];
    memcached = [ aiomcache ];
    msgpack = [ msgpack ];
  };

  pythonImportsCheck = [ "aiocache" ];

  meta = {
    description = "Asyncio cache supporting multiple backends (memory, redis, memcached, etc.)";
    homepage = "https://github.com/aio-libs/aiocache";
    license = lib.licenses.bsd3;
    maintainers = [ ];
  };
}
