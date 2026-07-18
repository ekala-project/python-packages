{
  lib,
  buildPythonPackage,
  fetchPypi,
  setuptools,
}:

buildPythonPackage rec {
  pname = "unicodedata2";
  version = "17.0.1";
  pyproject = true;

  src = fetchPypi {
    inherit pname version;
    hash = "sha256-15lD0VP19r++P1Wl7GEZhRhL2jf87bPsx1Mi2CrmrTs=";
  };

  build-system = [
    setuptools
  ];

  pythonImportsCheck = [ "unicodedata2" ];

  meta = {
    description = "Backport and updates for the unicodedata module";
    homepage = "https://github.com/mikekap/unicodedata2";
    license = lib.licenses.asl20;
  };
}
