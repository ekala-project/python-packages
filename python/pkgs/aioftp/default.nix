{
  lib,
  buildPythonPackage,
  fetchPypi,
  setuptools,
}:

buildPythonPackage (finalAttrs: {
  pname = "aioftp";
  version = "0.28.3";
  pyproject = true;

  src = fetchPypi {
    inherit (finalAttrs) pname version;
    hash = "sha256-8FTzryhbSVhiEiDwTOdV5YkHFAGB6V76hZNpCRyS0EA=";
  };

  build-system = [ setuptools ];

  pythonImportsCheck = [ "aioftp" ];

  meta = {
    description = "Python FTP client/server for asyncio";
    homepage = "https://aioftp.readthedocs.io/";
    license = lib.licenses.asl20;
  };
})
