{
  lib,
  fetchPypi,
  buildPythonPackage,
  setuptools,
}:

buildPythonPackage rec {
  pname = "pebble";
  version = "5.2.1";
  pyproject = true;

  src = fetchPypi {
    inherit pname version;
    hash = "sha256-l0NTeqDkB1Ghy/KXko4UG9IgKiRiSnwPn8FIGKfyJ7E=";
  };

  build-system = [ setuptools ];

  pythonImportsCheck = [ "pebble" ];

  meta = {
    description = "API to manage threads and processes within an application";
    homepage = "https://github.com/noxdafox/pebble";
    license = lib.licenses.lgpl3Plus;
  };
}
