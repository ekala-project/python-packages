{
  lib,
  boto3,
  botocore,
  buildPythonPackage,
  fastparquet,
  fetchPypi,
  fsspec,
  hatchling,
  hatch-vcs,
  pandas,
  pyarrow,
  python-dateutil,
  sqlalchemy,
  tenacity,
  tzdata,
}:

buildPythonPackage (finalAttrs: {
  pname = "pyathena";
  version = "4.2.1";
  pyproject = true;

  src = fetchPypi {
    inherit (finalAttrs) pname version;
    hash = "sha256-n3PpCzVaesXMdbLWFWCeUsz/J3Jr6OrbPHVf85qSpUk=";
  };

  build-system = [
    hatchling
    hatch-vcs
  ];

  pythonRelaxDeps = [
    "boto3"
    "botocore"
    "fsspec"
  ];

  dependencies = [
    boto3
    botocore
    fsspec
    tenacity
    python-dateutil
    tzdata
  ];

  optional-dependencies = {
    pandas = [ pandas ];
    sqlalchemy = [ sqlalchemy ];
    arrow = [ pyarrow ];
    fastparquet = [ fastparquet ];
  };

  # Nearly all tests depend on a working AWS Athena instance,
  # therefore deactivating them.
  # https://github.com/laughingman7743/PyAthena/#testing

  pythonImportsCheck = [ "pyathena" ];

  meta = {
    description = "Python DB API 2.0 (PEP 249) client for Amazon Athena";
    homepage = "https://github.com/laughingman7743/PyAthena/";
    license = lib.licenses.mit;
  };
})
