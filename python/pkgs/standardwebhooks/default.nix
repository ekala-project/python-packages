{
  lib,
  attrs,
  buildPythonPackage,
  deprecated,
  fetchPypi,
  httpx,
  python-dateutil,
  setuptools,
  types-deprecated,
  types-python-dateutil,
}:

buildPythonPackage (finalAttrs: {
  pname = "standardwebhooks";
  version = "1.0.1";
  pyproject = true;

  src = fetchPypi {
    inherit (finalAttrs) pname version;
    hash = "sha256-tVe7LksWraF5pRfsD+bL7FrPl2xWGZIr8pxFf4mkUb0=";
  };

  build-system = [ setuptools ];

  dependencies = [
    attrs
    deprecated
    httpx
    python-dateutil
    types-deprecated
    types-python-dateutil
  ];
  pythonImportsCheck = [ "standardwebhooks" ];

  meta = {
    description = "Standard Webhooks";
    homepage = "https://pypi.org/project/standardwebhooks/";
    license = lib.licenses.mit;
    maintainers = [ ];
  };
})
