{
  lib,
  attrs,
  authlib,
  avro,
  azure-identity,
  azure-keyvault-keys,
  boto3,
  buildPythonPackage,
  cachetools,
  fastavro,
  fetchFromGitHub,
  google-auth,
  google-api-core,
  google-cloud-kms,
  hvac,
  httpx,
  jsonschema,
  orjson,
  protobuf,
  pyrsistent,
  pyyaml,
  rdkafka,
  requests,
  setuptools,
}:

buildPythonPackage rec {
  pname = "confluent-kafka";
  version = "2.13.0";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "confluentinc";
    repo = "confluent-kafka-python";
    tag = "v${version}";
    hash = "sha256-VnZf6YvvpOs9/9uJHJvcmF56Ra9hhsoqrVisDuf+C6w=";
  };

  buildInputs = [ rdkafka ];

  build-system = [ setuptools ];

  optional-dependencies = {
    avro = [
      avro
      fastavro
      requests
    ];
    json = [
      jsonschema
      pyrsistent
      requests
    ];
    protobuf = [
      protobuf
      requests
    ];
    rules = [
      azure-identity
      azure-keyvault-keys
      boto3
      # TODO: cel-python
      google-auth
      google-api-core
      google-cloud-kms
      # hkdf was removed
      hvac
      # TODO: jsonata-python
      pyyaml
      # TODO: tink
    ];
    schema-registry = [
      attrs
      authlib
      cachetools
      httpx
      orjson
    ];
  };
  meta = {
    description = "Confluent's Apache Kafka client for Python";
    homepage = "https://github.com/confluentinc/confluent-kafka-python";
    license = lib.licenses.asl20;
    maintainers = [ ];
  };
}
