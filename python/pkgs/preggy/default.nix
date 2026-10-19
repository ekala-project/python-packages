{
  lib,
  buildPythonPackage,
  fetchPypi,

  # build-system
  setuptools,

  # dependencies
  six,
  unidecode,
}:

buildPythonPackage (finalAttrs: {
  pname = "preggy";
  version = "1.4.4";
  pyproject = true;

  src = fetchPypi {
    inherit (finalAttrs) pname version;
    hash = "sha256-JbqAOv3k8171Q6YJFc7S5jSSYjUGTfcXw8s+Tj60Zww=";
  };

  build-system = [ setuptools ];

  dependencies = [
    six
    unidecode
  ];

  pythonImportsCheck = [ "preggy" ];

  meta = {
    description = "Assertion library for Python";
    homepage = "http://heynemann.github.io/preggy/";
    license = lib.licenses.mit;
  };
})
