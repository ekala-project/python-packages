{
  lib,
  buildPythonPackage,
  fetchFromGitHub,

  # build-system
  gitpython,
  setuptools,
  setuptools-scm,

  # dependencies
  cachetools,
  grpcio,
  # milvus-lite, (unpackaged)
  orjson,
  pandas,
  protobuf,
  python-dotenv,

  # optional-dependencies
  azure-storage-blob,
  minio,
  pyarrow,
  requests,
  urllib3,
}:

buildPythonPackage (finalAttrs: {
  pname = "pymilvus";
  version = "2.6.12";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "milvus-io";
    repo = "pymilvus";
    tag = "v${finalAttrs.version}";
    hash = "sha256-vjXqGb4HYxa5qHpy8AJBO2G8s8AndJs+zGvxbfvwObY=";
  };

  build-system = [
    gitpython
    setuptools
    setuptools-scm
  ];

  pythonRelaxDeps = [
    "grpcio"
  ];

  pythonRemoveDeps = [
    "milvus-lite"
  ];

  dependencies = [
    cachetools
    grpcio
    # milvus-lite
    orjson
    pandas
    protobuf
    python-dotenv
    setuptools
  ];

  optional-dependencies = {
    bulk_writer = [
      azure-storage-blob
      minio
      pyarrow
      requests
      urllib3
    ];
  };

  pythonImportsCheck = [ "pymilvus" ];
  meta = {
    description = "Python SDK for Milvus";
    homepage = "https://github.com/milvus-io/pymilvus";
    license = lib.licenses.mit;
    maintainers = [ ];
  };
})
