{
  lib,
  buildPythonPackage,
  fetchFromGitHub,

  # build-system
  cython,
  setuptools,
  setuptools-scm,

  # nativeBuildInputs
  gitMinimal,

  # dependencies
  cramjam,
  fsspec,
  numpy,
  packaging,
  pandas,

  # optional-dependencies
  python-lzo,
}:

buildPythonPackage rec {
  pname = "fastparquet";
  version = "2026.5.0";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "dask";
    repo = "fastparquet";
    tag = version;
    hash = "sha256-thvoMXXiGtHGcJ0/IrGujjhVAvSmTMGmrlDHjG8R7PQ=";
  };

  build-system = [
    cython
    setuptools
    setuptools-scm
  ];

  nativeBuildInputs = [
    gitMinimal
  ];

  dependencies = [
    cramjam
    fsspec
    numpy
    packaging
    pandas
  ];

  optional-dependencies = {
    lzo = [ python-lzo ];
  };

  pythonImportsCheck = [ "fastparquet" ];

  meta = {
    description = "Implementation of the parquet format";
    homepage = "https://github.com/dask/fastparquet";
    license = lib.licenses.asl20;
    maintainers = [ ];
  };
}
