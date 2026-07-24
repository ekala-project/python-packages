{
  lib,
  buildPythonPackage,
  fetchPypi,
  setuptools,
}:

buildPythonPackage rec {
  pname = "iocapture";
  version = "0.1.2";
  pyproject = true;

  src = fetchPypi {
    inherit pname version;
    hash = "sha256-hmcOGAi83NT3ARL0Pacq52bwTNgxHRBxzm4OCnLjfug=";
  };

  build-system = [ setuptools ];

  pythonImportsCheck = [ "iocapture" ];

  meta = {
    description = "Capture stdout, stderr easily";
    homepage = "https://github.com/oinume/iocapture";
    license = lib.licenses.mit;
  };
}
