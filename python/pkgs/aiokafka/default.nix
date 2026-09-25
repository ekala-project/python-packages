{
  lib,
  async-timeout,
  buildPythonPackage,
  cramjam,
  cython,
  fetchFromGitHub,
  gssapi,
  packaging,
  setuptools,
  typing-extensions,
  zlib,
}:

buildPythonPackage rec {
  pname = "aiokafka";
  version = "0.14.0";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "aio-libs";
    repo = "aiokafka";
    tag = "v${version}";
    hash = "sha256-GkMIaMK6q8S0QcIcSQbiYPXGCLBS6V+rFZd5AYZlKbM=";
  };

  build-system = [
    cython
    setuptools
  ];

  buildInputs = [ zlib ];

  dependencies = [
    async-timeout
    packaging
    typing-extensions
  ];

  optional-dependencies = {
    snappy = [ cramjam ];
    lz4 = [ cramjam ];
    zstd = [ cramjam ];
    gssapi = [ gssapi ];
    all = [
      cramjam
      gssapi
    ];
  };

  # Checks require running Kafka server
  doCheck = false;

  pythonImportsCheck = [ "aiokafka" ];

  meta = {
    description = "Kafka integration with asyncio";
    homepage = "https://aiokafka.readthedocs.org";
    license = lib.licenses.asl20;
  };
}
