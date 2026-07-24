{
  aiohttp,
  appdirs,
  buildPythonPackage,
  click,
  cryptography,
  fetchFromGitHub,
  grpcio,
  humanize,
  lib,
  libusb-package,
  libusb1,
  platformdirs,
  prettytable,
  prompt-toolkit,
  protobuf,
  pyee,
  pyserial,
  pyserial-asyncio,
  pyusb,
  setuptools,
  setuptools-scm,
  tomli,
  websockets,
}:

buildPythonPackage rec {
  pname = "bumble";
  version = "0.0.233";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "google";
    repo = "bumble";
    tag = "v${version}";
    hash = "sha256-WTikxDp+V+H2RPN+myWg+CRgqncJY5v3zhwotfa8CCU=";
  };

  build-system = [
    setuptools
    setuptools-scm
  ];

  pythonRelaxDeps = [
    "libusb-package"
    "tomli"
  ];

  dependencies = [
    aiohttp
    appdirs
    click
    cryptography
    grpcio
    humanize
    libusb-package
    libusb1
    platformdirs
    prettytable
    prompt-toolkit
    protobuf
    pyee
    pyserial
    pyserial-asyncio
    pyusb
    tomli
    websockets
  ];

  pythonImportsCheck = [ "bumble" ];
  meta = {
    description = "Bluetooth Stack for Apps, Emulation, Test and Experimentation";
    homepage = "https://github.com/google/bumble";
    license = lib.licenses.asl20;
    maintainers = [ lib.maintainers.dotlambda ];
  };
}
