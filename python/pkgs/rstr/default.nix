{
  lib,
  buildPythonPackage,
  fetchPypi,

  # build-system
  setuptools,
  setuptools-scm,
}:

buildPythonPackage rec {
  pname = "rstr";
  version = "3.2.2";
  pyproject = true;

  src = fetchPypi {
    inherit pname version;
    hash = "sha256-xKVk1N+0Ry2THRRcQ9HPGteMJFkhQud1W4hmF57qwBI=";
  };

  build-system = [
    setuptools
    setuptools-scm
  ];

  pythonImportsCheck = [ "rstr" ];

  meta = {
    description = "Python library to generate random strings";
    homepage = "https://github.com/leapfrogonline/rstr";
    license = lib.licenses.bsd3;
  };
}
