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
  version = "1.9.0";
  pyproject = true;

  src = fetchPypi {
    pname = "os_service_types";
    inherit version;
    hash = "sha256-Hy5ftx0fb0/zHYmSZ08jaEZbwvJc2UAYAVw92/xcYX8=";
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
