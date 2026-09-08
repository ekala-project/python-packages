{
  lib,
  buildPythonPackage,
  fetchFromGitHub,
  replaceVars,

  certifi,
  cython,
  proj,
  setuptools,
}:

buildPythonPackage rec {
  pname = "pyproj";
  version = "3.8.0";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "pyproj4";
    repo = "pyproj";
    tag = version;
    hash = "sha256-+2wUMbswg2yltNMLPc9U8MbEFx2xKVWxGjP/TBfCjto=";
  };

  # force pyproj to use ${proj}
  patches = [
    (replaceVars ./001.proj.patch {
      proj = proj;
      projdev = proj.dev;
    })
  ];

  build-system = [
    cython
    setuptools
  ];

  buildInputs = [ proj ];

  dependencies = [ certifi ];

  pythonImportsCheck = [
    "pyproj"
    "pyproj.crs"
    "pyproj.transformer"
    "pyproj.geod"
    "pyproj.proj"
    "pyproj.database"
    "pyproj.list"
    "pyproj.datadir"
    "pyproj.network"
    "pyproj.sync"
    "pyproj.enums"
    "pyproj.aoi"
    "pyproj.exceptions"
  ];

  meta = {
    description = "Python interface to PROJ library";
    mainProgram = "pyproj";
    homepage = "https://github.com/pyproj4/pyproj";
    license = lib.licenses.mit;
    maintainers = [ ];
  };
}
