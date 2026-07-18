{
  lib,
  buildPythonPackage,
  fetchPypi,

  # build-system
  setuptools,

  # dependencies
  python-dateutil,
}:

buildPythonPackage rec {
  pname = "python-crontab";
  version = "3.3.0";
  pyproject = true;

  src = fetchPypi {
    pname = "python_crontab";
    inherit version;
    hash = "sha256-AHyK7mjd3z4E7E3OD6wSS5O9aL50cPyV0qlhehXeKRs=";
  };

  build-system = [ setuptools ];

  dependencies = [ python-dateutil ];

  pythonImportsCheck = [ "crontab" ];

  meta = {
    description = "Python API for crontab";
    homepage = "https://gitlab.com/doctormo/python-crontab/";
    license = lib.licenses.lgpl3Plus;
  };
}
