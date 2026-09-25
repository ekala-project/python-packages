{
  lib,
  buildPythonPackage,
  fetchFromGitHub,
  hatchling,
  lance-namespace-urllib3-client,
  pyarrow,
  typing-extensions,
  opendal,
  boto3,
  botocore,
  hive-metastore-client,
  thrift,
}:

buildPythonPackage (finalAttrs: {
  pname = "lance-namespace";
  version = "0.12.0";
  pyproject = true;
  __structuredAttrs = true;

  src = fetchFromGitHub {
    owner = "lancedb";
    repo = "lance-namespace";
    tag = "v${finalAttrs.version}";
    hash = "sha256-EShQE7azLthEOgQUPLPz/kVhdLrYbGnzqEUcGYY9Ve0=";
  };

  sourceRoot = "${finalAttrs.src.name}/python/lance_namespace";

  build-system = [
    hatchling
  ];

  dependencies = [
    lance-namespace-urllib3-client
    typing-extensions
    pyarrow
  ];

  optional-dependencies = {
    dir = [ opendal ];
    glue = [
      boto3
      botocore
    ];
    hive2 = [
      hive-metastore-client
      thrift
    ];
  };

  pythonImportsCheck = [ "lance_namespace" ];

  meta = {
    description = "Open specification on top of the storage-based Lance table and file format to standardize access to a collection of Lance tables";
    homepage = "https://github.com/lancedb/lance-namespace/tree/main/python/lance_namespace";
    license = lib.licenses.asl20;
  };
})
