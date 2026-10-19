{
  lib,
  buildPythonPackage,
  fetchFromGitHub,
  packaging,
  requests,
  setuptools,
}:

buildPythonPackage (finalAttrs: {
  pname = "pyzabbix";
  version = "1.3.1";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "lukecyca";
    repo = "pyzabbix";
    tag = finalAttrs.version;
    hash = "sha256-2yCbxPUlbTrtjD9eKmkw0fKnjiwPzmjIo5vKGv4aerU=";
  };

  nativeBuildInputs = [ setuptools ];

  dependencies = [
    packaging
    requests
  ];

  pythonImportsCheck = [ "pyzabbix" ];

  meta = {
    description = "Module to interact with the Zabbix API";
    homepage = "https://github.com/lukecyca/pyzabbix";
    license = lib.licenses.lgpl21Only;
  };
})
