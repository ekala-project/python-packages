{
  lib,
  buildPythonPackage,
  fetchFromGitHub,
  azure-common,
  azure-core,
  azure-storage-blob,
  boto3,
  google-cloud-storage,
  requests,
  paramiko,
  setuptools,
  setuptools-scm,
  wrapt,
}:

buildPythonPackage rec {
  pname = "smart-open";
  version = "8.0.1";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "RaRe-Technologies";
    repo = "smart_open";
    tag = "v${version}";
    hash = "sha256-Qr2GzmRDCCvR6Q/msSC8F2i8EDYmCIuQP8f593aIisI=";
  };

  build-system = [
    setuptools
    setuptools-scm
  ];

  dependencies = [ wrapt ];

  optional-dependencies = {
    s3 = [ boto3 ];
    gcs = [ google-cloud-storage ];
    azure = [
      azure-storage-blob
      azure-common
      azure-core
    ];
    http = [ requests ];
    webhdfs = [ requests ];
    ssh = [ paramiko ];
  };

  pythonImportsCheck = [ "smart_open" ];

  meta = {
    description = "Library for efficient streaming of very large file";
    homepage = "https://github.com/piskvorky/smart_open";
    license = lib.licenses.mit;
  };
}
