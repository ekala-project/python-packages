{
  lib,
  buildPythonPackage,
  fetchPypi,
  python-dateutil,
  setuptools,
  typing-extensions,
  tzdata,
}:

buildPythonPackage rec {
  pname = "faker";
  version = "40.38.0";
  pyproject = true;

  src = fetchPypi {
    inherit pname version;
    hash = "sha256-cuQhCYZk7fOEePQmml1aU5M33l2hiIPOZ8sea7lrCzo=";
  };

  build-system = [ setuptools ];

  dependencies = [
    python-dateutil
    typing-extensions
    tzdata
  ];

  pythonImportsCheck = [ "faker" ];

  meta = {
    description = "Python library for generating fake user data";
    mainProgram = "faker";
    homepage = "http://faker.rtfd.org";
    license = lib.licenses.mit;
  };
}
