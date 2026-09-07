{
  lib,
  buildPythonPackage,
  fetchFromGitHub,
  cryptography,
  cython,
  poetry-core,
  pytest-codspeed,
  pytest-cov-stub,
  setuptools,
}:

buildPythonPackage (finalAttrs: {
  pname = "bluetooth-data-tools";
  version = "1.29.24";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "Bluetooth-Devices";
    repo = "bluetooth-data-tools";
    tag = "v${finalAttrs.version}";
    hash = "sha256-NPr9jZbqO78FUxJgGApkqdmU5V9BSZ3qpP9cbwCIqEA=";
  };

  # The project can build both an optimized cython version and an unoptimized
  # python version. This ensures we fail if we build the wrong one.
  env.REQUIRE_CYTHON = 1;

  build-system = [
    cython
    poetry-core
    setuptools
  ];

  dependencies = [ cryptography ];
  pythonImportsCheck = [ "bluetooth_data_tools" ];

  meta = {
    description = "Library for converting bluetooth data and packets";
    homepage = "https://github.com/Bluetooth-Devices/bluetooth-data-tools";
    license = lib.licenses.asl20;
    maintainers = [ ];
  };
})
