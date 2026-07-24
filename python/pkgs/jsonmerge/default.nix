{
  lib,
  buildPythonPackage,
  fetchPypi,
  setuptools,
  jsonschema,
}:

buildPythonPackage rec {
  pname = "jsonmerge";
  version = "1.9.2";
  pyproject = true;

  src = fetchPypi {
    inherit pname version;
    hash = "sha256-xDdX4BgLDhm3rkwTCtQqB8xYDDGRL2H0gj6Ory+jlKM=";
  };

  build-system = [ setuptools ];

  dependencies = [ jsonschema ];

  pythonImportsCheck = [ "jsonmerge" ];

  meta = {
    description = "Merge a series of JSON documents";
    homepage = "https://github.com/avian2/jsonmerge";
    license = lib.licenses.mit;
  };
}
