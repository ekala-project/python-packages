{
  lib,
  buildPythonPackage,
  fetchPypi,
  setuptools,
}:

buildPythonPackage rec {
  pname = "XStatic";
  version = "1.0.3";
  pyproject = true;

  src = fetchPypi {
    inherit pname version;
    hash = "sha256-QCVEzJ4XlIlEEFTwnIB4BOEV6iRpB96HwDVftPWjEmg=";
  };

  build-system = [ setuptools ];

  pythonImportsCheck = [ "xstatic" ];

  meta = {
    description = "Base packaged static files for python";
    homepage = "https://github.com/xstatic-py/xstatic";
    license = lib.licenses.mit;
  };
}
