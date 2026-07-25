{
  lib,
  buildPythonPackage,
  fetchFromGitHub,
  gdal,

  # build-system
  cython,
  setuptools,
  versioneer,

  # dependencies
  certifi,
  numpy,
  packaging,
}:

buildPythonPackage (finalAttrs: {
  pname = "pyogrio";
  version = "0.13.0";
  pyproject = true;
  __structuredAttrs = true;

  src = fetchFromGitHub {
    owner = "geopandas";
    repo = "pyogrio";
    tag = "v${finalAttrs.version}";
    hash = "sha256-9WaJMrh3FN4hWpdGNq2TynoLqT91tLQ7iTTl/NWYQTI=";
  };

  postPatch = ''
    substituteInPlace pyproject.toml \
      --replace-fail \
        "versioneer[toml]==0.28" \
        "versioneer[toml]"
  '';

  build-system = [
    cython
    setuptools
    versioneer
  ];

  nativeBuildInputs = [
    gdal # for gdal-config
  ];

  buildInputs = [ gdal ];

  dependencies = [
    certifi
    numpy
    packaging
  ];

  pythonImportsCheck = [ "pyogrio" ];
  disabledTestMarks = [
    # disable tests which require network access
    "network"
  ];
  meta = {
    description = "Vectorized spatial vector file format I/O using GDAL/OGR";
    homepage = "https://pyogrio.readthedocs.io/";
    license = lib.licenses.mit;
    teams = [ lib.teams.geospatial ];
  };
})
