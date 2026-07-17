{
  lib,
  buildPythonPackage,
  fetchPypi,
  setuptools,
}:

buildPythonPackage rec {
  pname = "sdnotify";
  version = "0.3.2";
  pyproject = true;

  src = fetchPypi {
    inherit pname version;
    hash = "sha256-c5d/x0azbMQRhN1Dw/6BMj57iwbCuwgmxPWaIMVrufE=";
  };

  build-system = [ setuptools ];

  doCheck = false;

  pythonImportsCheck = [ "sdnotify" ];

  meta = {
    description = "Pure Python implementation of systemd's service notification protocol";
    homepage = "https://github.com/bb4242/sdnotify";
    license = lib.licenses.mit;
  };
}
