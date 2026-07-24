{
  lib,
  fetchPypi,
  buildPythonPackage,
  setuptools,
}:

buildPythonPackage rec {
  pname = "tblib";
  version = "3.2.2";
  pyproject = true;

  src = fetchPypi {
    inherit pname version;
    hash = "sha256-6aZSaS2Rv090PUoVvBdMC3avx1D+jHttGVzBwdbSzOw=";
  };

  build-system = [ setuptools ];

  pythonImportsCheck = [ "tblib" ];

  meta = {
    description = "Traceback fiddling library. Allows you to pickle tracebacks";
    homepage = "https://github.com/ionelmc/python-tblib";
    license = lib.licenses.bsd2;
  };
}
