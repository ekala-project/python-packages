{
  lib,
  buildPythonPackage,
  fetchPypi,
  setuptools,
}:

buildPythonPackage rec {
  pname = "timeout-decorator";
  version = "0.5.0";
  pyproject = true;

  src = fetchPypi {
    inherit pname version;
    hash = "sha256-ai8vWNscWySizHneY0V2A3eti9wTgT9SZfbD5j0Ws9c=";
  };

  build-system = [ setuptools ];

  pythonImportsCheck = [ "timeout_decorator" ];

  meta = {
    description = "Timeout decorator";
    homepage = "https://github.com/pnpnpn/timeout-decorator";
    license = lib.licenses.mit;
  };
}
