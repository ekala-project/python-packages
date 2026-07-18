{
  lib,
  buildPythonPackage,
  fetchPypi,
  poetry-core,
}:

buildPythonPackage rec {
  pname = "wakeonlan";
  version = "3.3.0";
  pyproject = true;

  src = fetchPypi {
    inherit pname version;
    hash = "sha256-gOwhY+yzoJHG+mVeXjEGlozqpFQe2Qr6Y5HRAR/vcfI=";
  };

  build-system = [ poetry-core ];

  pythonImportsCheck = [ "wakeonlan" ];

  meta = {
    description = "Python module for wake on lan";
    mainProgram = "wakeonlan";
    homepage = "https://github.com/remcohaszing/pywakeonlan";
    license = lib.licenses.mit;
  };
}
