{
  lib,
  fetchPypi,
  buildPythonPackage,
  setuptools,
  zope_interface,
  zope_exceptions,
}:

buildPythonPackage rec {
  pname = "zope.testrunner";
  version = "8.2";
  pyproject = true;

  src = fetchPypi {
    pname = "zope_testrunner";
    inherit version;
    hash = "sha256-H0AWw+6FA6BplGAApVR5ZG2wqD7UzSvI5Uz7bCfYiUY=";
  };

  build-system = [ setuptools ];

  dependencies = [
    zope_interface
    zope_exceptions
  ];

  doCheck = false;

  pythonImportsCheck = [ "zope.testrunner" ];

  pythonNamespaces = [ "zope" ];

  meta = {
    description = "Flexible test runner with layer support";
    homepage = "https://github.com/zopefoundation/zope.testrunner";
    license = lib.licenses.zpl21;
  };
}
