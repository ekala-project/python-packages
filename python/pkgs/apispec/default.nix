{
  lib,
  buildPythonPackage,
  fetchPypi,

  # build-system
  flit-core,

  # dependencies
  packaging,
}:

buildPythonPackage (finalAttrs: {
  pname = "apispec";
  version = "6.10.1";
  pyproject = true;

  src = fetchPypi {
    inherit (finalAttrs) pname version;
    hash = "sha256-RolssMqyO06FPlKFKJN3GXOfg2NYgyu4YQ7dFNsdnAE=";
  };

  build-system = [ flit-core ];

  dependencies = [ packaging ];

  pythonImportsCheck = [ "apispec" ];

  meta = {
    description = "Pluggable API specification generator with support for the OpenAPI Specification";
    homepage = "https://github.com/marshmallow-code/apispec";
    license = lib.licenses.mit;
  };
})
