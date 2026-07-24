{
  lib,
  buildPythonPackage,
  fetchPypi,

  # build-system
  flit-core,

  # dependencies
  packaging,
}:

buildPythonPackage rec {
  pname = "apispec";
  version = "6.10.0";
  pyproject = true;

  src = fetchPypi {
    inherit pname version;
    hash = "sha256-CoiFVc1KpftxdgQb4VaEFU/YlhBV4WcucDq/c36HYb8=";
  };

  build-system = [ flit-core ];

  dependencies = [ packaging ];

  pythonImportsCheck = [ "apispec" ];

  meta = {
    description = "Pluggable API specification generator with support for the OpenAPI Specification";
    homepage = "https://github.com/marshmallow-code/apispec";
    license = lib.licenses.mit;
  };
}
