{
  lib,
  buildPythonPackage,
  fetchFromGitHub,
  setuptools,
  setuptools-scm,
  aiohttp,
  pytest,
  pytest-asyncio,
}:

buildPythonPackage (finalAttrs: {
  pname = "pytest-aiohttp";
  version = "1.1.1";
  pyproject = true;
  src = fetchFromGitHub {
    owner = "aio-libs";
    repo = "pytest-aiohttp";
    tag = "v${finalAttrs.version}";
    hash = "sha256-SYMwVmcgPLOasW6TQGqqNO+sbp8zQQtDHb3IyAVO6KI=";
  };

  build-system = [
    setuptools
    setuptools-scm
  ];

  buildInputs = [ pytest ];

  dependencies = [
    aiohttp
    pytest-asyncio
  ];
  meta = {
    homepage = "https://github.com/aio-libs/pytest-aiohttp/";
    description = "Pytest plugin for aiohttp support";
    license = lib.licenses.asl20;
    maintainers = [ ];
  };
})
