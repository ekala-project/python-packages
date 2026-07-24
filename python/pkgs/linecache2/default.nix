{
  lib,
  fetchPypi,
  buildPythonPackage,
  setuptools,
  pbr,
}:

buildPythonPackage rec {
  pname = "linecache2";
  version = "1.0.0";
  pyproject = true;

  src = fetchPypi {
    inherit pname version;
    hash = "sha256-Syb/TnEQ23butvWntkqCYjg51ZXCA47tpmLyott46Xw=";
  };

  build-system = [
    setuptools
    pbr
  ];

  pythonImportsCheck = [ "linecache2" ];

  meta = {
    homepage = "https://github.com/testing-cabal/linecache2";
    description = "Backport of linecache to older supported Pythons";
    license = lib.licenses.psfl;
  };
}
