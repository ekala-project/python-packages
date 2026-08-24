{ lib
, buildPythonPackage
, fetchFromGitHub
, setuptools
,
}:

buildPythonPackage rec {
  pname = "pycdlib";
  version = "1.16.0";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "clalancette";
    repo = "pycdlib";
    tag = "v${version}";
    hash = "sha256-uJ9rMriRCLXpKekG8vGsIw+s0e6wlfX0soAYs6HGe0Y=";
  };

  build-system = [ setuptools ];

  pythonImportsCheck = [ "pycdlib" ];

  meta = {
    description = "Pure python library to read and write ISO9660 files";
    homepage = "https://github.com/clalancette/pycdlib";
    license = lib.licenses.lgpl2Only;
    maintainers = [ ];
    platforms = lib.platforms.all;
  };
}
