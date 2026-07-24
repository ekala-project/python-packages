{
  lib,
  fetchPypi,
  buildPythonPackage,
  setuptools,
  humanfriendly,
}:

buildPythonPackage rec {
  pname = "coloredlogs";
  version = "15.0.1";
  pyproject = true;

  src = fetchPypi {
    inherit pname version;
    hash = "sha256-fJkapxpFd68vgmANj486ifk2uur5tQqcGX2gFOW/FrA=";
  };

  build-system = [ setuptools ];

  dependencies = [ humanfriendly ];

  pythonImportsCheck = [ "coloredlogs" ];

  meta = {
    description = "Colored stream handler for Python's logging module";
    homepage = "https://github.com/xolox/python-coloredlogs";
    license = lib.licenses.mit;
  };
}
