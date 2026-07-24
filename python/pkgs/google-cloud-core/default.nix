{
  lib,
  buildPythonPackage,
  fetchFromGitHub,
  setuptools,
  google-api-core,
  google-auth,
  grpcio,
  grpcio-status,
}:

buildPythonPackage rec {
  pname = "google-cloud-core";
  version = "2.5.0";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "googleapis";
    repo = "python-cloud-core";
    tag = "v${version}";
    hash = "sha256-mB0gHxyK+g+e5I/3TRVAyQzPu005ug7fTvRNxciJ9LQ=";
  };

  build-system = [ setuptools ];

  dependencies = [
    google-auth
    google-api-core
  ];

  optional-dependencies = {
    grpc = [
      grpcio
      grpcio-status
    ];
  };

  pythonImportsCheck = [ "google.cloud" ];

  meta = {
    description = "API Client library for Google Cloud: Core Helpers";
    homepage = "https://github.com/googleapis/python-cloud-core";
    license = lib.licenses.asl20;
  };
}
