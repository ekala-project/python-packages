{
  lib,
  buildPythonPackage,
  fetchFromGitHub,
  setuptools,
  setuptools-scm,
  packaging,
  requests,
  pyyaml,
}:

buildPythonPackage rec {
  pname = "pynetbox";
  version = "7.8.0";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "netbox-community";
    repo = "pynetbox";
    tag = "v${version}";
    hash = "sha256-vHtKWiaIb1dwzXaFDqDQ3iWCHYtCqOJD5PMKigXbHtU=";
  };

  build-system = [
    setuptools
    setuptools-scm
  ];

  dependencies = [
    packaging
    requests
  ];

  pythonImportsCheck = [ "pynetbox" ];
  meta = {
    description = "API client library for Netbox";
    homepage = "https://github.com/netbox-community/pynetbox";
    license = lib.licenses.asl20;
    maintainers = [ ];
  };
}
