{
  lib,
  async-interrupt,
  bleak-retry-connector,
  bleak,
  bluetooth-adapters,
  bluetooth-auto-recovery,
  bluetooth-data-tools,
  buildPythonPackage,
  cython,
  fetchFromGitHub,
  poetry-core,
  setuptools,
}:

buildPythonPackage (finalAttrs: {
  pname = "habluetooth";
  version = "6.26.5";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "Bluetooth-Devices";
    repo = "habluetooth";
    tag = "v${finalAttrs.version}";
    hash = "sha256-IM3M4fWTdD4wT3UsNiLZq7QX3p9pf+lR3x84vuOICMM=";
  };

  build-system = [
    cython
    poetry-core
    setuptools
  ];

  dependencies = [
    async-interrupt
    bleak
    bleak-retry-connector
    bluetooth-adapters
    bluetooth-auto-recovery
    bluetooth-data-tools
  ];

  pythonImportsCheck = [ "habluetooth" ];

  meta = {
    description = "Library for high availability Bluetooth";
    homepage = "https://github.com/Bluetooth-Devices/habluetooth";
    license = lib.licenses.asl20;
    maintainers = [ ];
  };
})
