{
  lib,
  buildPythonPackage,
  fetchPypi,

  # build-system
  setuptools,
  pbr,

  # dependencies
  attrs,
  jsonpickle,
}:

buildPythonPackage rec {
  pname = "jschema-to-python";
  version = "1.2.3";
  pyproject = true;

  src = fetchPypi {
    pname = "jschema_to_python";
    inherit version;
    hash = "sha256-dv8U/l0wRwjMrRKE5LEflqZYlJox7n+u2eCZUnlUm5E=";
  };

  build-system = [
    setuptools
    pbr
  ];

  dependencies = [
    attrs
    jsonpickle
  ];

  pythonImportsCheck = [ "jschema_to_python" ];

  meta = {
    description = "Generate source code for Python classes from a JSON schema";
    homepage = "https://github.com/microsoft/jschema-to-python";
    license = lib.licenses.mit;
  };
}
