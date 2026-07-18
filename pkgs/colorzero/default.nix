{
  lib,
  fetchPypi,
  buildPythonPackage,
  setuptools,
  pkginfo,
}:

buildPythonPackage rec {
  pname = "colorzero";
  version = "2.0";
  pyproject = true;

  src = fetchPypi {
    inherit pname version;
    hash = "sha256-59WlwmzQ3DexZOvvxgnziN4k+Fk7ZZGR4S2F+PnV61g=";
  };

  build-system = [
    setuptools
    pkginfo
  ];

  pythonImportsCheck = [ "colorzero" ];

  meta = {
    description = "Yet another Python color library";
    homepage = "https://github.com/waveform80/colorzero";
    license = lib.licenses.bsd3;
  };
}
