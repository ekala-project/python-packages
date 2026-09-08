{
  lib,
  fetchPypi,
  buildPythonPackage,
  setuptools,
}:

buildPythonPackage rec {
  pname = "pebble";
  version = "5.2.2";
  pyproject = true;

  src = fetchPypi {
    inherit pname version;
    hash = "sha256-60mg9oYvfnXfSkAQfxyMJnz4rfvW0poNrCnResGIyHg=";
  };

  build-system = [ setuptools ];

  pythonImportsCheck = [ "pebble" ];

  meta = {
    description = "API to manage threads and processes within an application";
    homepage = "https://github.com/noxdafox/pebble";
    license = lib.licenses.lgpl3Plus;
  };
}
