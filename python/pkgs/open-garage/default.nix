{
  lib,
  aiohttp,
  async-timeout,
  buildPythonPackage,
  fetchFromGitHub,
}:

buildPythonPackage rec {
  pname = "open-garage";
  version = "0.2.0";
  format = "setuptools";

  src = fetchFromGitHub {
    owner = "Danielhiversen";
    repo = "pyOpenGarage";
    tag = version;
    hash = "sha256-iJ7HcJhpTceFpHTUdNZOYDuxUWZGWPmZ9lxD3CyGvk8=";
  };

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
