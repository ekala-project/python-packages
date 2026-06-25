{
  lib,
  azure-identity,
  azure-storage-blob,
  billiard,
  boto3,
  brotli,
  buildPythonPackage,
  click,
  click-didyoumean,
  click-plugins,
  click-repl,
  cryptography,
  exceptiongroup,
  django,
  elastic-transport,
  elasticsearch,
  fetchFromGitHub,
  gevent,
  google-cloud-storage,
  grpcio,
  kombu,
  pydantic,
  python-dateutil,
  pyzmq,
  setuptools,
  tzlocal,
  urllib3,
  vine,
  zstandard,
  withAmqpRepl ? false,
}:

buildPythonPackage (finalAttrs: {
  pname = "celery";
  version = "5.6.3";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "celery";
    repo = "celery";
    tag = "v${finalAttrs.version}";
    hash = "sha256-5YPM8/AnCSjeDDMQ30kTNjPr6QdlUiqzzBadtmjqoNg=";
  };

  patches = lib.optionals (!withAmqpRepl) [
    ./remove-amqp-repl.patch
  ];

  build-system = [ setuptools ];

  dependencies = [
    billiard
    click
    click-didyoumean
    click-plugins
    exceptiongroup
    kombu
    python-dateutil
    tzlocal
    vine
  ]
  ++ lib.optionals withAmqpRepl [
    click-repl
  ];

  optional-dependencies = {
    arangodb = [
    ];
    auth = [ cryptography ];
    azureblockblob = [
      azure-identity
      azure-storage-blob
    ];
    brotli = [ brotli ];
    consul = [
    ];
    cosmosdbsql = [ ];
    couchbase = [ ];
    couchdb = [
    ];
    django = [ django ];
    dynamodb = [ boto3 ];
    elasticsearch = [
      elasticsearch
      elastic-transport
    ];
    eventlet = [ ];
    gcs = [
      google-cloud-storage
      grpcio
    ];
    gevent = [ gevent ];
    memcache = [ ];
    mongodb = kombu.optional-dependencies.mongodb;
    msgpack = kombu.optional-dependencies.msgpack;
    pydantic = [ pydantic ];
    pymemcache = [ ];
    pyro = [ ];
    pytest = [ ];
    redis = kombu.optional-dependencies.redis;
    s3 = [ boto3 ];
    slmq = [
    ];
    sqlalchemy = kombu.optional-dependencies.sqlalchemy;
    sqs = [
      boto3
      urllib3
    ]
    ++ kombu.optional-dependencies.sqs;
    thread = [ ];
    yaml = kombu.optional-dependencies.yaml;
    zeromq = [ pyzmq ];
    zsdt = [ zstandard ];
  };

  pythonImportsCheck = [ "celery" ];

  meta = {
    description = "Distributed task queue";
    homepage = "https://github.com/celery/celery/";
    license = lib.licenses.bsd3;
    mainProgram = "celery";
  };
})
