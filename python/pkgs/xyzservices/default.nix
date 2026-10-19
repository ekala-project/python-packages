{
  lib,
  buildPythonPackage,
  fetchPypi,
  mercantile,
  requests,
  setuptools,
  setuptools-scm,
}:

buildPythonPackage (finalAttrs: {
  pname = "xyzservices";
  version = "2026.9.1";
  pyproject = true;

  src = fetchPypi {
    inherit (finalAttrs) pname version;
    hash = "sha256-jRo5v2sZKUDMXbUmTu78GyDdGE+Lg7EwOweHQ3RPWUM=";
  };

  nativeBuildInputs = [
    setuptools
    setuptools-scm
  ];

  disabledTestMarks = [
    # requires network connections
    "request"
  ];

  pythonImportsCheck = [ "xyzservices.providers" ];
  meta = {
    description = "Source of XYZ tiles providers";
    homepage = "https://github.com/geopandas/xyzservices";
    license = lib.licenses.bsd3;
  };
})
