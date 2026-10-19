{
  lib,
  buildPythonPackage,
  fetchPypi,
  setuptools,
}:

buildPythonPackage (finalAttrs: {
  pname = "pyleri";
  version = "1.5.1";
  pyproject = true;

  src = fetchPypi {
    inherit (finalAttrs) pname version;
    hash = "sha256-mY1bDMRTlA4XU/waz4ORJWh4bm3G/kXzwlpvTqcqOCY=";
  };

  build-system = [ setuptools ];

  pythonImportsCheck = [ "pyleri" ];

  meta = {
    description = "Module to parse SiriDB";
    homepage = "https://github.com/cesbit/pyleri";
    license = lib.licenses.mit;
  };
})
