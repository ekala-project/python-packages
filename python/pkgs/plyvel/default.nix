{
  lib,
  buildPythonPackage,
  fetchPypi,
  # build-system
  setuptools,
  pkgs,
}:

buildPythonPackage rec {
  pname = "plyvel";
  version = "1.5.1";
  pyproject = true;

  src = fetchPypi {
    inherit pname version;
    hash = "sha256-PK9gCeT8JPv4cS0/XvPaflZJXCakiN8hYSGPw05GAZw=";
  };

  build-system = [ setuptools ];

  buildInputs = [ pkgs.leveldb ];

  pythonImportsCheck = [ "plyvel" ];

  meta = {
    description = "Fast and feature-rich Python interface to LevelDB";
    platforms = lib.platforms.unix;
    homepage = "https://github.com/wbolster/plyvel";
    license = lib.licenses.bsd3;
  };
}
