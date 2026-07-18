{
  lib,
  buildPythonPackage,
  fetchPypi,
  setuptools,
  pyserial,
}:

buildPythonPackage rec {
  pname = "pyserial-asyncio";
  version = "0.6";
  pyproject = true;

  src = fetchPypi {
    inherit pname version;
    hash = "sha256-tgMpI+BenXXsF6WvmphCnEbSg5rfr4BgTVLg+qzXoy8=";
  };

  build-system = [ setuptools ];

  dependencies = [ pyserial ];

  pythonImportsCheck = [ "serial_asyncio" ];

  meta = {
    description = "Asyncio extension package for pyserial";
    homepage = "https://github.com/pyserial/pyserial-asyncio";
    license = lib.licenses.bsd3;
  };
}
