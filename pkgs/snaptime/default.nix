{
  lib,
  fetchPypi,
  buildPythonPackage,
  setuptools,
  python-dateutil,
  pytz,
}:

buildPythonPackage rec {
  pname = "snaptime";
  version = "0.2.4";
  pyproject = true;

  src = fetchPypi {
    inherit pname version;
    hash = "sha256-4/HriQQ9WNMHIauYy2UCPxpMJ0DjsZdwQpixY8ktUIs=";
  };

  build-system = [ setuptools ];

  dependencies = [
    python-dateutil
    pytz
  ];

  pythonImportsCheck = [ "snaptime" ];

  meta = {
    description = "Transform timestamps with a simple DSL";
    homepage = "https://github.com/zartstrom/snaptime";
    license = lib.licenses.mit;
  };
}
