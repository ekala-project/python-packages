{
  lib,
  aiohttp,
  async-timeout,
  buildPythonPackage,
  fetchFromGitHub,
  # build-system
  setuptools,
}:

buildPythonPackage rec {
  pname = "open-garage";
  version = "0.2.0";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "Danielhiversen";
    repo = "pyOpenGarage";
    tag = version;
    hash = "sha256-iJ7HcJhpTceFpHTUdNZOYDuxUWZGWPmZ9lxD3CyGvk8=";
  };

  build-system = [ setuptools ];

  dependencies = [
    aiohttp
    async-timeout
  ];

  # Project has no tests

  pythonImportsCheck = [ "opengarage" ];

  meta = {
    description = "Python module to communicate with opengarage.io";
    homepage = "https://github.com/Danielhiversen/pyOpenGarage";
    license = lib.licenses.mit;
  };
}
