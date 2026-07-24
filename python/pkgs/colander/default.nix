{
  lib,
  buildPythonPackage,
  fetchPypi,

  # build-system
  babel,
  setuptools,

  # dependencies
  translationstring,
  iso8601,
}:

buildPythonPackage rec {
  pname = "colander";
  version = "2.0";
  pyproject = true;

  src = fetchPypi {
    inherit pname version;
    hash = "sha256-QZzWgXjS7m7kyuXVyxgwclY0sKKECRcVbonrJZIjfvM=";
  };

  build-system = [
    babel
    setuptools
  ];

  dependencies = [
    translationstring
    iso8601
  ];

  pythonImportsCheck = [ "colander" ];

  meta = {
    description = "Simple schema-based serialization and deserialization library";
    homepage = "https://github.com/Pylons/colander";
    license = lib.licenses.free;
  };
}
