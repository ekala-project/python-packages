{
  lib,
  buildPythonPackage,
  fetchFromGitHub,
  poetry-core,
  pytest-asyncio,
  pytest-cov-stub,
}:

buildPythonPackage rec {
  pname = "uart-devices";
  version = "0.1.1";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "bdraco";
    repo = "uart-devices";
    tag = "v${version}";
    hash = "sha256-vBwQXeXw9y7eETtlC4dcqGytIgrAm7iomnvoaxhl6JI=";
  };

  build-system = [ poetry-core ];
  pythonImportsCheck = [ "uart_devices" ];

  meta = {
    description = "UART Devices for Linux";
    homepage = "https://github.com/bdraco/uart-devices";
    license = lib.licenses.mit;
    maintainers = [ ];
    platforms = lib.platforms.linux;
  };
}
