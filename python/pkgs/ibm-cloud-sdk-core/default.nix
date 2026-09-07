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
  version = "3.26.1";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "IBM";
    repo = "python-sdk-core";
    tag = "v${version}";
    hash = "sha256-8gZrjPlvYY3KCDVDqjQUdGpgGo/XrxHS0Z7PMmHdh5g=";
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
