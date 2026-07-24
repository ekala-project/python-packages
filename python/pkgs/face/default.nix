{
  lib,
  buildPythonPackage,
  fetchPypi,

  # build-system
  setuptools,

  # dependencies
  boltons,
}:

buildPythonPackage rec {
  pname = "face";
  version = "24.0.0";
  pyproject = true;

  src = fetchPypi {
    inherit pname version;
    hash = "sha256-YR4poBrFlw8Ad/nFd+dG1IwIJYi0EbM6DdVcTYcpSfY=";
  };

  build-system = [ setuptools ];

  dependencies = [ boltons ];

  pythonImportsCheck = [ "face" ];

  meta = {
    homepage = "https://github.com/mahmoud/face";
    description = "Command-line interface parser and framework";
    license = lib.licenses.bsd3;
  };
}
