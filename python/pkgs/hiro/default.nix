{
  lib,
  buildPythonPackage,
  fetchPypi,

  # build-system
  setuptools,

  # dependencies
  six,
  mock,
}:

buildPythonPackage rec {
  pname = "hiro";
  version = "1.1.1";
  pyproject = true;

  src = fetchPypi {
    inherit pname version;
    hash = "sha256-2jM5rx3JpZTMqdycccclJysuMGYE5F0OBXXNE8X5XWg=";
  };

  build-system = [ setuptools ];

  dependencies = [
    six
    mock
  ];

  pythonImportsCheck = [ "hiro" ];

  meta = {
    description = "Time manipulation utilities for Python";
    homepage = "https://hiro.readthedocs.io/en/latest/";
    license = lib.licenses.mit;
  };
}
