{
  lib,
  buildPythonPackage,
  fetchPypi,
  setuptools,
  attrs,
}:

buildPythonPackage (finalAttrs: {
  pname = "outcome";
  version = "1.3.0.post0";
  pyproject = true;

  src = fetchPypi {
    inherit (finalAttrs) pname version;
    hash = "sha256-nc8C5l8pcbgAR7N3Ro5yomjhXArzzxI45v8U9/kRQ7g=";
  };

  build-system = [ setuptools ];

  dependencies = [ attrs ];

  pythonImportsCheck = [ "outcome" ];

  meta = {
    homepage = "https://github.com/python-trio/outcome";
    description = "Capture the outcome of Python function calls";
    license = with lib.licenses; [
      mit
      asl20
    ];
  };
})
