{
  lib,
  buildPythonPackage,
  fetchFromGitHub,
  fetchpatch2,
  replaceVars,

  certifi,
  cython,
  proj,
  setuptools,
}:

buildPythonPackage rec {
  pname = "pyproj";
  version = "3.7.2";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "pyproj4";
    repo = "pyproj";
    tag = version;
    hash = "sha256-WV344gxcmq08sIUVevn6uD50FSy4JvLt4aret5ZakYQ=";
  };

  # force pyproj to use ${proj}
  patches = [
    (replaceVars ./001.proj.patch {
      proj = proj;
      projdev = proj.dev;
    })
    # PROJ 9.8.0 compatibility
    (fetchpatch2 {
      url = "https://github.com/pyproj4/pyproj/pull/1557.diff?full_index=1";
      hash = "sha256-3iK/JaQEgyQvPjybJF/ATxOy3fFl7q6aa9tdfsrhajM=";
    })
    (fetchpatch2 {
      url = "https://github.com/pyproj4/pyproj/pull/1560.diff?full_index=1";
      hash = "sha256-fr+lvDeVFDagc9aHzaQhyZtWK2sy5kR7iImJsuxW8Z4=";
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
