{
  lib,
  buildPythonPackage,
  cython,
  fetchPypi,
  # build-system
  setuptools,
  numpy,
}:

buildPythonPackage rec {
  pname = "cftime";
  version = "1.6.5";
  pyproject = true;

  src = fetchPypi {
    inherit pname version;
    hash = "sha256-giX+1rm0P7h2g+urUhMEUPwXMAERUNMJIJapDlTR6B4=";
  };

  build-system = [ setuptools ];

  nativeBuildInputs = [
    cython
    numpy
  ];

  dependencies = [ numpy ];
  pythonImportsCheck = [ "cftime" ];

  meta = {
    description = "Time-handling functionality from netcdf4-python";
    homepage = "https://github.com/Unidata/cftime";
    license = lib.licenses.mit;
  };
}
