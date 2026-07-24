{
  lib,
  buildPythonPackage,
  fetchFromGitHub,
  packaging,
  setuptools,
  setuptools-scm,
  shapely,
  sqlalchemy,
  alembic,
  pytest-benchmark,
}:

buildPythonPackage rec {
  pname = "geoalchemy2";
  version = "0.18.4";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "geoalchemy";
    repo = "geoalchemy2";
    tag = version;
    hash = "sha256-kSsKud4/uL5ycPiuS+JPXJ6XH9ZgQ+kHOTC5RtG9C0I=";
  };

  build-system = [
    setuptools
    setuptools-scm
  ];

  dependencies = [
    sqlalchemy
    packaging
  ];
  pythonImportsCheck = [ "geoalchemy2" ];

  optional-dependencies = {
    shapely = [ shapely ];
  };

  meta = {
    description = "Toolkit for working with spatial databases";
    homepage = "https://geoalchemy-2.readthedocs.io/";
    license = lib.licenses.mit;
    maintainers = [ ];
  };
}
