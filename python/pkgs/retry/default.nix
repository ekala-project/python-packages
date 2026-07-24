{
  lib,
  buildPythonPackage,
  fetchPypi,

  # build-system
  setuptools,
  pbr,

  # dependencies
  decorator,
  py,
}:

buildPythonPackage rec {
  pname = "retry";
  version = "0.9.2";
  pyproject = true;

  src = fetchPypi {
    inherit pname version;
    hash = "sha256-+L+ouZtpxFBtb1vTsKq/d/mM2xfzyfw/XKggAzM2+6Q=";
  };

  build-system = [
    setuptools
    pbr
  ];

  dependencies = [
    decorator
    py
  ];

  pythonImportsCheck = [ "retry" ];

  meta = {
    description = "Easy to use retry decorator";
    homepage = "https://github.com/invl/retry";
    license = lib.licenses.asl20;
  };
}
