{
  lib,
  buildPythonPackage,
  fetchPypi,
  setuptools,
  h11,
}:

buildPythonPackage rec {
  pname = "wsproto";
  version = "1.3.2";
  pyproject = true;

  src = fetchPypi {
    inherit pname version;
    hash = "sha256-uGiF3PKU4VIEkZlQ9mbgb/xsfBFMqQCwYNbhYpNSgpQ=";
  };

  build-system = [ setuptools ];

  dependencies = [ h11 ];

  pythonImportsCheck = [ "wsproto" ];

  meta = {
    description = "Pure Python, pure state-machine WebSocket implementation";
    homepage = "https://github.com/python-hyper/wsproto/";
    license = lib.licenses.mit;
  };
}
