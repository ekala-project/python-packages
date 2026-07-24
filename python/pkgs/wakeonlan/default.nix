{
  lib,
  buildPythonPackage,
  fetchPypi,
  poetry-core,
}:

buildPythonPackage rec {
  pname = "wakeonlan";
  version = "4.0.0";
  pyproject = true;

  src = fetchPypi {
    inherit pname version;
    hash = "sha256-HLMMSuYPhe8on099T3Azgu0ZuoQQMgbcXiseUb7J9FY=";
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
