{
  lib,
  aiohttp,
  async-timeout,
  buildPythonPackage,
  click,
  fetchFromGitHub,
  # build-system
  setuptools,
}:

buildPythonPackage (finalAttrs: {
  pname = "dingz";
  version = "0.5.0";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "home-assistant-ecosystem";
    repo = "python-dingz";
    tag = finalAttrs.version;
    hash = "sha256-bCytQwLWw8D1UkKb/3LQ301eDCkVR4alD6NHjTs6I+4=";
  };

  build-system = [ setuptools ];

  dependencies = [
    aiohttp
    async-timeout
    click
  ];

  # Project has no tests

  pythonImportsCheck = [ "dingz" ];

  meta = {
    description = "Python API for interacting with Dingz devices";
    mainProgram = "dingz";
    homepage = "https://github.com/home-assistant-ecosystem/python-dingz";
    license = lib.licenses.mit;
  };
})
