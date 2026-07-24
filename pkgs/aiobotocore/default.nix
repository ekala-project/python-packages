{
  lib,
  buildPythonPackage,
  fetchFromGitHub,

  # build-system
  setuptools,

  # dependencies
  aiohttp,
  aioitertools,
  botocore,
  python-dateutil,
  jmespath,
  multidict,
  urllib3,
  wrapt,

  # optional-dependencies
  awscli,
  boto3,
  httpx,
}:

buildPythonPackage rec {
  pname = "aiobotocore";
  version = "3.8.0";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "aio-libs";
    repo = "aiobotocore";
    tag = version;
    hash = "sha256-56mKFeKHtQtAhtOkwI8VfR6oJzyqXtbNS2ebgkFlTME=";
  };

  pythonRelaxDeps = [ "botocore" ];

  build-system = [
    setuptools
  ];

  dependencies = [
    aiohttp
    aioitertools
    botocore
    python-dateutil
    jmespath
    multidict
    urllib3
    wrapt
  ];

  optional-dependencies = {
    awscli = [ awscli ];
    boto3 = [ boto3 ];
    httpx = [ httpx ];
  };

  pythonImportsCheck = [ "aiobotocore" ];

  meta = {
    description = "Python client for amazon services";
    homepage = "https://github.com/aio-libs/aiobotocore";
    license = lib.licenses.asl20;
  };
}
