{
  lib,
  stdenv,
  buildPythonPackage,
  fetchFromGitHub,

  # build-system
  setuptools,
  setuptools-scm,

  # dependencies
  numpy,
  packaging,
  pandas,
  pydantic,
  typeguard,
  typing-extensions,
  typing-inspect,

  # optional-dependencies
  black,
  dask,
  duckdb,
  fastapi,
  frictionless,
  geopandas,
  hypothesis,
  ibis-framework,
  pandas-stubs,
  polars,
  pyyaml,
  scipy,
  shapely,

  # tests
  joblib,
  pyarrow-hotfix,
  pyarrow,
  pytest-asyncio,
  pythonAtLeast,
  rich,
}:

buildPythonPackage (finalAttrs: {
  pname = "pandera";
  version = "0.30.1";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "unionai-oss";
    repo = "pandera";
    tag = "v${finalAttrs.version}";
    hash = "sha256-JmD8p0Syt/Tgf9LiMWeug1dSPp4cyd7BtBfo6yi08xg=";
  };

  build-system = [
    setuptools
    setuptools-scm
  ];

  dependencies = [
    packaging
    pydantic
    typeguard
    typing-extensions
    typing-inspect
  ];

  optional-dependencies =
    let
      dask-dataframe = [ dask ] ++ dask.optional-dependencies.dataframe;
      extras = {
        strategies = [ hypothesis ];
        hypotheses = [ scipy ];
        io = [
          pyyaml
          black
          frictionless
        ];
        # pyspark expression does not define optional-dependencies.connect:
        #pyspark = [ pyspark ] ++ pyspark.optional-dependencies.connect;
        # modin not in nixpkgs:
        #modin = [
        #  modin
        #  ray
        #] ++ dask-dataframe;
        #modin-ray = [
        #  modin
        #  ray
        #];
        #modin-dask = [
        #  modin
        #] ++ dask-dataframe;
        dask = dask-dataframe;
        mypy = [ pandas-stubs ];
        fastapi = [ fastapi ];
        geopandas = [
          geopandas
          shapely
        ];
        ibis = [
          ibis-framework
          duckdb
        ];
        pandas = [
          numpy
          pandas
        ];
        polars = [ polars ];
      };
    in
    extras // { all = lib.concatLists (lib.attrValues extras); };
  pythonImportsCheck = [
    "pandera"
    "pandera.api"
    "pandera.config"
    "pandera.dtypes"
    "pandera.engines"
  ];

  meta = {
    description = "Light-weight, flexible, and expressive statistical data testing library";
    homepage = "https://pandera.readthedocs.io";
    license = lib.licenses.mit;
    maintainers = [ ];
  };
})
