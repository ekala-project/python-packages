{
  lib,
  buildPythonPackage,
  fetchPypi,
  setuptools,
  ply,
  six,
  decorator,
}:

buildPythonPackage (finalAttrs: {
  pname = "jsonpath-rw";
  version = "1.4.0";
  pyproject = true;

  src = fetchPypi {
    inherit (finalAttrs) pname version;
    hash = "sha256-BcRxKBxFrhE/YQPRJo7HpIMaLpaqgN5F7cibEfrE++w=";
  };

  build-system = [ setuptools ];

  dependencies = [
    ply
    six
    decorator
  ];

  pythonImportsCheck = [ "jsonpath_rw" ];

  meta = {
    description = "Robust and significantly extended implementation of JSONPath for Python";
    homepage = "https://github.com/kennknowles/python-jsonpath-rw";
    license = lib.licenses.asl20;
  };
})
