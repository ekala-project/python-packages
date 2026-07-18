{
  lib,
  buildPythonPackage,
  fetchPypi,
  faker,
  setuptools,
}:

buildPythonPackage rec {
  pname = "factory-boy";
  version = "3.3.3";
  pyproject = true;

  src = fetchPypi {
    pname = "factory_boy";
    inherit version;
    hash = "sha256-hmhi0iYSjfrH8rQWAofomdr1TyYSd4Mn3QPQ4ssePQM=";
  };

  build-system = [ setuptools ];

  dependencies = [ faker ];

  pythonImportsCheck = [ "factory" ];

  meta = {
    description = "Python package to create factories for complex objects";
    homepage = "https://github.com/rbarrois/factory_boy";
    license = lib.licenses.mit;
  };
}
