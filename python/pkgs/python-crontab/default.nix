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
  version = "3.4.0";
  pyproject = true;

  src = fetchPypi {
    pname = "python_crontab";
    inherit version;
    hash = "sha256-0rWtkfemQdd0Zht/O6UiWP1oJzhiyIcT9MwJK6YU5wc=";
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
