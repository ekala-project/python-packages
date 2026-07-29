{
  lib,
  buildPythonPackage,
  fetchPypi,
  pkgs,
}:

buildPythonPackage rec {
  pname = "plyvel";
  version = "1.5.1";
  format = "setuptools";

  src = fetchPypi {
    inherit pname version;
    hash = "sha256-PK9gCeT8JPv4cS0/XvPaflZJXCakiN8hYSGPw05GAZw=";
  };

  buildInputs = [ pkgs.leveldb ];

  pythonImportsCheck = [ "plyvel" ];

  meta = {
    description = "Fast and feature-rich Python interface to LevelDB";
    platforms = lib.platforms.unix;
    homepage = "https://github.com/wbolster/plyvel";
    license = lib.licenses.bsd3;
    maintainers = [ ];
  };
}
