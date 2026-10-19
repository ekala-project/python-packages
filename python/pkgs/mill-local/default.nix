{
  lib,
  aiohttp,
  async-timeout,
  buildPythonPackage,
  fetchFromGitHub,
  setuptools_80,
}:

buildPythonPackage (finalAttrs: {
  pname = "mill-local";
  version = "0.5.0";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "Danielhiversen";
    repo = "pyMillLocal";
    tag = finalAttrs.version;
    hash = "sha256-t6nZ6KXX5GFIcdNIXyFxYtSjOuuUJmCekaBITNgcIkU=";
  };

  buildInputs = [ setuptools_80 ];

  dependencies = [
    aiohttp
    async-timeout
  ];

  # Project has no tests

  pythonImportsCheck = [ "mill_local" ];

  meta = {
    description = "Python module to communicate locally with Mill heaters";
    homepage = "https://github.com/Danielhiversen/pyMillLocal";
    license = lib.licenses.mit;
  };
})
