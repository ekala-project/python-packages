{
  lib,
  buildPythonPackage,
  fetchPypi,
  setuptools,
}:

buildPythonPackage (finalAttrs: {
  pname = "types-pyyaml";
  version = "6.0.12.20261111";
  pyproject = true;

  src = fetchPypi {
    pname = "types_pyyaml";
    inherit (finalAttrs) version;
    hash = "sha256-xRH1Y+r4ILlIxP9vQ/4LnUiyJ75EKmkFjZ9o8TnK4fs=";
  };

  build-system = [ setuptools ];

  # Module doesn't have tests

  pythonImportsCheck = [ "yaml-stubs" ];

  meta = {
    description = "Typing stubs for PyYAML";
    homepage = "https://github.com/python/typeshed";
    license = lib.licenses.asl20;
  };
})
