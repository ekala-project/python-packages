{
  lib,
  buildPythonPackage,
  fetchPypi,
  setuptools,
}:

buildPythonPackage rec {
  pname = "polib";
  version = "1.2.0";
  pyproject = true;

  src = fetchPypi {
    inherit pname version;
    hash = "sha256-8++Urv7W4YPjQqiiaa4fxHQroZMYatdvF1k4Yh2/wms=";
  };

  build-system = [ setuptools ];

  pythonImportsCheck = [ "polib" ];

  meta = {
    description = "Library to manipulate gettext files (po and mo files)";
    homepage = "https://bitbucket.org/izi/polib/";
    license = lib.licenses.mit;
  };
}
