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
  version = "40.35.0";
  pyproject = true;

  src = fetchPypi {
    inherit pname version;
    hash = "sha256-E0lTSOxvgNIsjBZUkG/+rjNtSF/qR2VEZC6iSxINnhM=";
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
