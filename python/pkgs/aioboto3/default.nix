{
  lib,
  stdenv,
  buildPythonPackage,
  fetchFromGitHub,

  # build-system
  setuptools,
  setuptools-scm,

  # dependencies
  aiobotocore,
  aiofiles,

  # optional-dependencies
  # chalice
  chalice,
  # s3cse
  cryptography,

  # tests
  dill,
  moto,
  pytest-asyncio,
}:

buildPythonPackage (finalAttrs: {
  pname = "aioboto3";
  version = "15.5.0";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "terricain";
    repo = "aioboto3";
    tag = "v${finalAttrs.version}";
    hash = "sha256-yGKjcZlXs1f72OGX5rUWvfDKZAYU3ZV2RVQnd0InxBQ=";
  };

  pythonRelaxDeps = [
    "aiobotocore"
  ];

  build-system = [
    setuptools
    setuptools-scm
  ];

  dependencies = [
    aiobotocore
    aiofiles
  ]
  ++ aiobotocore.optional-dependencies.boto3;

  optional-dependencies = {
    chalice = [ chalice ];
    s3cse = [ cryptography ];
  };
pythonImportsCheck = [ "aioboto3" ];

  meta = {
    description = "Wrapper to use boto3 resources with the aiobotocore async backend";
    homepage = "https://github.com/terricain/aioboto3";
    license = lib.licenses.asl20;
    maintainers = [ ];
  };
})
