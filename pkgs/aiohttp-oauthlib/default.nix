{
  lib,
  buildPythonPackage,
  fetchPypi,
  setuptools,
  setuptools-scm,
  oauthlib,
  aiohttp,
}:

buildPythonPackage rec {
  pname = "aiohttp-oauthlib";
  version = "0.1.0";
  pyproject = true;

  src = fetchPypi {
    inherit pname version;
    hash = "sha256-iTzRpZ3dDC5OmA46VE+XELfE/7nie0zQOLUf4dcDk7c=";
  };

  build-system = [
    setuptools
    setuptools-scm
  ];

  dependencies = [
    oauthlib
    aiohttp
  ];

  pythonImportsCheck = [ "aiohttp_oauthlib" ];

  meta = {
    description = "oauthlib integration for aiohttp clients";
    homepage = "https://git.sr.ht/~whynothugo/aiohttp-oauthlib";
    license = lib.licenses.isc;
  };
}
