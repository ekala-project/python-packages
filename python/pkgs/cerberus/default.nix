{
  lib,
  fetchPypi,
  buildPythonPackage,
  setuptools,
}:

buildPythonPackage rec {
  pname = "cerberus";
  version = "1.3.8";
  pyproject = true;

  src = fetchPypi {
    inherit pname version;
    hash = "sha256-V5VUiH/9GJImd0uHVw9Kdtt1zw78uv/KzV6YuO6Hf2E=";
  };

  build-system = [ setuptools ];

  pythonImportsCheck = [ "cerberus" ];

  meta = {
    homepage = "http://python-cerberus.org/";
    description = "Schema and data validation tool for Python dictionaries";
    license = lib.licenses.mit;
  };
}
