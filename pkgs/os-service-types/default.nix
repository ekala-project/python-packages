{
  lib,
  fetchPypi,
  buildPythonPackage,
  pbr,
  setuptools,
  typing-extensions,
}:

buildPythonPackage rec {
  pname = "os-service-types";
  version = "1.8.2";
  pyproject = true;

  src = fetchPypi {
    pname = "os_service_types";
    inherit version;
    hash = "sha256-q3ZI1yMoSZQxluG7AKMOLiXmAPo7V7skHRW39SG1tXU=";
  };

  build-system = [
    pbr
    setuptools
  ];

  dependencies = [
    pbr
    typing-extensions
  ];

  pythonImportsCheck = [ "os_service_types" ];

  doCheck = false;

  meta = {
    description = "Python library for consuming OpenStack service-types-authority data";
    homepage = "https://github.com/openstack/os-service-types";
    license = lib.licenses.asl20;
  };
}
