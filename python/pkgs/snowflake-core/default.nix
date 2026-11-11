{
  lib,
  buildPythonPackage,
  pydantic,
  python-dateutil,
  requests,
  snowflake-connector-python,
  pyyaml,
  urllib3,
  fetchPypi,
  hatchling,
}:

buildPythonPackage (finalAttrs: {
  pname = "snowflake-core";
  version = "1.15.0";
  pyproject = true;

  src = fetchPypi {
    pname = "snowflake_core";
    inherit (finalAttrs) version;
    hash = "sha256-0YGCOnhyfuexSWRhcS+fDD9kNluVr1SOmBBPIKF9lpg=";
  };

  build-system = [ hatchling ];

  dependencies = [
    pydantic
    python-dateutil
    pyyaml
    requests
    snowflake-connector-python
    urllib3
  ];

  pythonRelaxDeps = [
    "certifi"
    "pyopenssl"
  ];

  # Tests require access to Snowflake

  pythonImportsCheck = [
    "snowflake.core"
  ];

  meta = {
    description = "Subpackage providing Python access to Snowflake entity metadata";
    homepage = "https://pypi.org/project/snowflake.core";
    license = lib.licenses.asl20;
  };
})
