{
  lib,
  aiohttp,
  async-timeout,
  buildPythonPackage,
  fetchFromGitHub,
  pyjwt,
  setuptools,
}:

buildPythonPackage rec {
  pname = "millheater";
  version = "012.2";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "Danielhiversen";
    repo = "pymill";
    tag = version;
    hash = "sha256-tR6MZIgCazGcXRIaSXyDYIEp+kD6xyrpOXORbi8LV7E=";
  };

  build-system = [ setuptools ];

  dependencies = [
    aiohttp
    async-timeout
    pyjwt
  ];

  # Project has no tests
  doCheck = false;

  pythonImportsCheck = [ "mill" ];

  meta = {
    description = "Python library for Mill heater devices";
    homepage = "https://github.com/Danielhiversen/pymill";
    license = lib.licenses.mit;
    maintainers = [ ];
  };
}
