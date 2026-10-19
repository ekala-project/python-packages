{
  lib,
  buildPythonPackage,
  fetchPypi,
  setuptools,
}:

buildPythonPackage (finalAttrs: {
  pname = "canonicaljson";
  version = "2.0.0";
  pyproject = true;

  src = fetchPypi {
    inherit (finalAttrs) pname version;
    hash = "sha256-4v2u8df63F2ctZvT0NQbBk3dppeAmsQyXc7XIdEvET8=";
  };

  build-system = [ setuptools ];

  pythonImportsCheck = [ "canonicaljson" ];

  meta = {
    description = "Encodes objects and arrays as RFC 7159 JSON";
    homepage = "https://github.com/matrix-org/python-canonicaljson";
    license = lib.licenses.asl20;
  };
})
