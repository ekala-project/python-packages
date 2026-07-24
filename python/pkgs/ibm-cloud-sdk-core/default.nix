{
  lib,
  buildPythonPackage,
  fetchFromGitHub,
  pyjwt,
  python-dateutil,
  requests,
  responses,
  setuptools,
}:

buildPythonPackage rec {
  pname = "ibm-cloud-sdk-core";
  version = "3.25.0";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "IBM";
    repo = "python-sdk-core";
    tag = "v${version}";
    hash = "sha256-UA4xZ9doaz/4yYdbXJoevXrdzsrfuv/nhSd2+rkHAQ4=";
  };

  pythonRelaxDeps = [ "requests" ];

  build-system = [ setuptools ];

  dependencies = [
    pyjwt
    python-dateutil
    requests
  ];
  meta = {
    description = "Client library for the IBM Cloud services";
    homepage = "https://github.com/IBM/python-sdk-core";
    license = lib.licenses.asl20;
    maintainers = [ ];
  };
}
