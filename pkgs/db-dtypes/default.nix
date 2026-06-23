{
  lib,
  buildPythonPackage,
  fetchFromGitHub,
  numpy,
  packaging,
  pandas,
  pyarrow,
  setuptools,
}:

buildPythonPackage rec {
  pname = "db-dtypes";
  version = "1.5.0";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "googleapis";
    repo = "python-db-dtypes-pandas";
    tag = "v${version}";
    hash = "sha256-cF40Y2J944AojOXKoTzQ/ybTFY4GP5G8KWY6+NWyRT8=";
  };

  build-system = [ setuptools ];

  dependencies = [
    numpy
    packaging
    pandas
    pyarrow
  ];

  pythonImportsCheck = [ "db_dtypes" ];

  meta = {
    description = "Pandas Data Types for SQL systems (BigQuery, Spanner)";
    homepage = "https://github.com/googleapis/python-db-dtypes-pandas";
    license = lib.licenses.asl20;
  };
}
