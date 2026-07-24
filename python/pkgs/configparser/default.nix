{
  lib,
  buildPythonPackage,
  fetchPypi,
  setuptools,
  setuptools-scm,
}:

buildPythonPackage rec {
  pname = "configparser";
  version = "7.2.0";
  pyproject = true;

  src = fetchPypi {
    inherit pname version;
    hash = "sha256-tinMiukW46+9NtGz0JPzQZPYUeEZmJIP3PxFUiGLe3A=";
  };

  build-system = [
    setuptools
    setuptools-scm
  ];

  pythonImportsCheck = [ "configparser" ];

  meta = {
    description = "Updated configparser from Python 3.7 for Python 2.6+";
    homepage = "https://github.com/jaraco/configparser";
    license = lib.licenses.mit;
  };
}
