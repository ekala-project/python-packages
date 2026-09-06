{
  lib,
  buildPythonPackage,
  fetchFromGitHub,

  # build-system
  hatchling,
  hatch-fancy-pypi-readme,

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
  version = "3.9.1";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "aio-libs";
    repo = "aiobotocore";
    tag = version;
    hash = "sha256-VlQS47FmjFHq3Q2VGa4nGPPnG7qhFgEVxovhCuh7rxI=";
  };

  pythonRelaxDeps = [ "botocore" ];

  build-system = [
    hatchling
    hatch-fancy-pypi-readme
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
