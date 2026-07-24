{
  lib,
  buildPythonPackage,
  fetchPypi,

  # build-system
  setuptools,

  # dependencies
  aiohttp,
  jinja2,
}:

buildPythonPackage rec {
  pname = "aiohttp-jinja2";
  version = "1.6";
  pyproject = true;

  src = fetchPypi {
    inherit pname version;
    hash = "sha256-o6f/UmTlvKUuiuVHu/0HYbcklSMNQ40FtsCRW+YZsOI=";
  };

  build-system = [ setuptools ];

  dependencies = [
    aiohttp
    jinja2
  ];

  pythonImportsCheck = [ "aiohttp_jinja2" ];

  meta = {
    description = "Jinja2 support for aiohttp";
    homepage = "https://github.com/aio-libs/aiohttp_jinja2";
    license = lib.licenses.asl20;
  };
}
