{
  lib,
  fetchPypi,
  buildPythonPackage,
  persistent,
  zope-interface,
  python,
  setuptools,
}:

buildPythonPackage rec {
  pname = "btrees";
  version = "6.5";
  pyproject = true;

  src = fetchPypi {
    inherit pname version;
    hash = "sha256-GHbK0OvKw/aNrc3KgBjqbLdrM0+Zkac6qFy7DLj9jPA=";
  };

  build-system = [ setuptools ];

  dependencies = [
    persistent
    zope-interface
  ];

  pythonImportsCheck = [
    "BTrees.OOBTree"
    "BTrees.IOBTree"
    "BTrees.IIBTree"
    "BTrees.IFBTree"
  ];

  meta = {
    description = "Scalable persistent components";
    homepage = "http://packages.python.org/BTrees";
    license = lib.licenses.zpl21;
  };
}
