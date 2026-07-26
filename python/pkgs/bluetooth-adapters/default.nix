{
  lib,
  aiohttp,
  aiooui,
  async-timeout,
  bleak,
  buildPythonPackage,
  dbus-fast,
  fetchFromGitHub,
  mac-vendor-lookup,
  poetry-core,
  uart-devices,
  usb-devices,
}:

buildPythonPackage (finalAttrs: {
  pname = "bluetooth-adapters";
  version = "2.4.0";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "Bluetooth-Devices";
    repo = "bluetooth-adapters";
    tag = "v${finalAttrs.version}";
    hash = "sha256-d1vHb1WvsumlvilwuV6yfTwMXViLqeosSSM3LijIGYY=";
  };

  build-system = [
    poetry-core
  ];

  dependencies = [
    aiohttp
    aiooui
    async-timeout
    bleak
    dbus-fast
    mac-vendor-lookup
    uart-devices
    usb-devices
  ];

  pythonImportsCheck = [ "bluetooth_adapters" ];

  meta = {
    description = "Tools to enumerate and find Bluetooth Adapters";
    homepage = "https://github.com/Bluetooth-Devices/bluetooth-adapters";
    license = lib.licenses.asl20;
    maintainers = [ ];
  };
})
