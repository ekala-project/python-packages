{
  lib,
  fetchPypi,
  buildPythonPackage,
  setuptools,
}:

buildPythonPackage (finalAttrs: {
  pname = "random2";
  version = "1.0.2";
  pyproject = true;

  src = fetchPypi {
    inherit (finalAttrs) pname version;
    hash = "sha256-N1T870gmdWfNVwX6faa7w4Ccs/gIdAMT5nBazDwFfnc=";
  };

  build-system = [ setuptools ];

  pythonImportsCheck = [ "random2" ];

  meta = {
    description = "Python 3 compatible Python 2 random Module";
    homepage = "http://pypi.org/pypi/random2/";
    license = lib.licenses.psfl;
  };
})
