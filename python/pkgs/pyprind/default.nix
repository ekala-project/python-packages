{
  lib,
  buildPythonPackage,
  fetchPypi,
  setuptools,
}:

buildPythonPackage (finalAttrs: {
  pname = "pyprind";
  version = "2.11.3";
  pyproject = true;

  src = fetchPypi {
    pname = "PyPrind";
    inherit (finalAttrs) version;
    hash = "sha256-433KtuGpyOCn8PzmX956eeLe2hx1qgFZEKSeITe1TL8=";
  };

  build-system = [ setuptools ];

  pythonImportsCheck = [ "pyprind" ];

  meta = {
    description = "Python Progress Bar and Percent Indicator Utility";
    homepage = "https://github.com/rasbt/pyprind";
    license = lib.licenses.bsd3;
  };
})
