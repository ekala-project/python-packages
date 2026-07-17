{
  lib,
  buildPythonPackage,
  fetchPypi,
  setuptools,
}:

buildPythonPackage rec {
  pname = "ansicolors";
  version = "1.1.8";
  pyproject = true;

  src = fetchPypi {
    inherit pname version;
    extension = "zip";
    hash = "sha256-mflPXjNIoLzUPILl/EQUATzMGdcL2TmtceATPOnDcuA=";
  };

  build-system = [ setuptools ];

  pythonImportsCheck = [ "colors" ];

  meta = {
    description = "ANSI colors for Python";
    homepage = "https://github.com/verigak/colors/";
    license = lib.licenses.isc;
  };
}
