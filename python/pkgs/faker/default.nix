{
  lib,
  buildPythonPackage,
  fetchPypi,
  python-dateutil,
  setuptools,
  typing-extensions,
  tzdata,
}:

buildPythonPackage (finalAttrs: {
  pname = "faker";
  version = "40.54.0";
  pyproject = true;

  src = fetchPypi {
    inherit (finalAttrs) pname version;
    hash = "sha256-OPunPjJpmp8QcXJNZ+WmaoS/BXmHz/snydDJef2j8TU=";
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
})
