{
  buildPythonPackage,
  fetchFromGitHub,
  lib,

  # build system
  setuptools,

  # optional dependencies
  crc32c,
  lz4,
  python-snappy,
  zstandard,
}:

buildPythonPackage (finalAttrs: {
  pname = "kafka-python";
  version = "3.0.9";
  pyproject = true;
  __structuredAttrs = true;

  src = fetchFromGitHub {
    owner = "dpkp";
    repo = "kafka-python";
    tag = finalAttrs.version;
    hash = "sha256-Dvi5zWArY3QkQYUhM4XU//2HiSZ1Ks4bJFJ6a9xIEPQ=";
  };

  build-system = [ setuptools ];

  optional-dependencies = {
    crc32c = [ crc32c ];
    lz4 = [ lz4 ];
    snappy = [ python-snappy ];
    zstd = [ zstandard ];
  };

  pythonImportsCheck = [
    "kafka"
    "kafka.consumer"
    "kafka.producer"
    "kafka.protocol"
  ];

  meta = {
    description = "Pure Python client for Apache Kafka";
    homepage = "https://github.com/dpkp/kafka-python";
    license = lib.licenses.asl20;
    maintainers = [ ];
  };
})
