{
  lib,
  buildPythonPackage,
  fetchFromGitHub,

  # build-system
  cython,
  gdal,
  setuptools,

  # dependencies
  attrs,
  certifi,
  click,
  click-plugins,
  cligj,

  # optional-dependencies
  pyparsing,
  shapely,
  boto3,

  # tests
  fsspec,
  pytz,
  snuggs,
}:

buildPythonPackage (finalAttrs: {
  pname = "fiona";
  version = "1.10.1";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "Toblerity";
    repo = "Fiona";
    tag = finalAttrs.version;
    hash = "sha256-5NN6PBh+6HS9OCc9eC2TcBvkcwtI4DV8qXnz4tlaMXc=";
  };

  postPatch = ''
    substituteInPlace pyproject.toml \
      --replace-fail "cython~=3.0.2" cython
  ''
  +
    # pyparsing deprecated parseString in favor of parse_string
    ''
      substituteInPlace fiona/fio/features.py fiona/_vendor/snuggs.py \
        --replace-fail parseString parse_string
    '';

  build-system = [
    cython
    gdal # for gdal-config
    setuptools
  ];

  buildInputs = [ gdal ];

  dependencies = [
    attrs
    certifi
    click
    click-plugins
    cligj
  ];

  optional-dependencies = {
    calc = [
      pyparsing
      shapely
    ];
    s3 = [ boto3 ];
  };

  pythonImportsCheck = [ "fiona" ];
  # prevent importing local fiona
  disabledTestMarks = [
    # Tests with gdal marker do not test the functionality of Fiona,
    # but they are used to check GDAL driver capabilities.
    "gdal"
  ];
  meta = {
    description = "OGR's neat, nimble, no-nonsense API for Python";
    mainProgram = "fio";
    homepage = "https://fiona.readthedocs.io/";
    license = lib.licenses.bsd3;
    teams = [ lib.teams.geospatial ];
  };
})
