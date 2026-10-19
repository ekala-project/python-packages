{
  lib,
  buildPythonPackage,
  fetchPypi,
  # build-system
  setuptools,
  requests,
}:

buildPythonPackage rec {
  pname = "eagle100";
  version = "0.1.1";
  pyproject = true;

  src = fetchPypi {
    inherit pname version;
    hash = "sha256-eyYY1x8IjIfUx5OiaOomiWunsO1++seFwXlI/iKDDLw=";
  };

  build-system = [ setuptools ];

  dependencies = [ requests ];

  # Project has no tests

  pythonImportsCheck = [ "eagle100" ];

  meta = {
    description = "Python library for interacting with Rainforest EAGLE devices";
    homepage = "https://github.com/hastarin/eagle100";
    license = lib.licenses.mit;
  };
}
