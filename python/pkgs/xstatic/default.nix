{
  lib,
  buildPythonPackage,
  fetchPypi,
  setuptools_80,
}:

buildPythonPackage (finalAttrs: {
  pname = "XStatic";
  version = "1.0.3";
  pyproject = true;

  src = fetchPypi {
    inherit (finalAttrs) pname version;
    hash = "sha256-QCVEzJ4XlIlEEFTwnIB4BOEV6iRpB96HwDVftPWjEmg=";
  };

  build-system = [ setuptools_80 ];

  pythonImportsCheck = [ "xstatic" ];

  meta = {
    description = "Base packaged static files for python";
    homepage = "https://github.com/xstatic-py/xstatic";
    license = lib.licenses.mit;
  };
})
