{
  lib,
  fetchPypi,
  # build-system
  setuptools,
  buildPythonPackage,
  dm-tree,
  numpy,
  absl-py,
  pytestCheckHook,
}:

buildPythonPackage rec {
  pname = "dm-env";
  version = "1.6";
  pyproject = true;

  src = fetchPypi {
    inherit pname version;
    hash = "sha256-pDbrHGVMOeDJhqUWzuIYvqcUC1EPzv9j+X60/P89k94=";
  };

  build-system = [ setuptools ];

  buildInputs = [
    absl-py
    dm-tree
    numpy
  ];

  nativeCheckInputs = [ pytestCheckHook ];

  pythonImportsCheck = [ "dm_env" ];

  meta = {
    description = "Pure Python client for Apache Kafka";
    homepage = "https://github.com/dpkp/kafka-python";
    license = lib.licenses.asl20;
  };
}
