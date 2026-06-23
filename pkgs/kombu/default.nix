{
  lib,
  amqp,
  azure-identity,
  azure-servicebus,
  azure-storage-queue,
  boto3,
  buildPythonPackage,
  confluent-kafka,
  fetchFromGitHub,
  google-cloud-pubsub,
  google-cloud-monitoring,
  grpcio,
  kazoo,
  msgpack,
  packaging,
  protobuf,
  pycurl,
  pymongo,
  pyyaml,
  redis,
  setuptools,
  sqlalchemy,
  tzdata,
  urllib3,
  vine,
}:

buildPythonPackage rec {
  pname = "kombu";
  version = "5.6.2";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "celery";
    repo = "kombu";
    tag = "v${version}";
    hash = "sha256-J0cEQsMHKethrfDVDDvIjc/iZpoCYLH9INHtgKmH9Pk=";
  };

  build-system = [ setuptools ];

  dependencies = [
    amqp
    packaging
    tzdata
    vine
  ];

  optional-dependencies = {
    msgpack = [ msgpack ];
    yaml = [ pyyaml ];
    redis = [ redis ];
    mongodb = [ pymongo ];
    sqs = [
      boto3
      urllib3
      pycurl
    ];
    zookeeper = [ kazoo ];
    sqlalchemy = [ sqlalchemy ];
    azurestoragequeues = [
      azure-identity
      azure-storage-queue
    ];
    azureservicebus = [ azure-servicebus ];
    confluentkafka = [ confluent-kafka ];
    gcpubsub = [
      google-cloud-pubsub
      google-cloud-monitoring
      grpcio
      protobuf
    ];
  };

  pythonImportsCheck = [ "kombu" ];

  meta = {
    description = "Messaging library for Python";
    homepage = "https://github.com/celery/kombu";
    license = lib.licenses.bsd3;
  };
}
