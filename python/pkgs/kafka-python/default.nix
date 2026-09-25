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
  version = "3.0.11";
  pyproject = true;
  __structuredAttrs = true;

  src = fetchFromGitHub {
    owner = "dpkp";
    repo = "kafka-python";
    tag = finalAttrs.version;
    hash = "sha256-DwehLBH5OK7DSfMlgbAGvkVrkNBCUazjOYRDUgrtsOU=";
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
  };
})
