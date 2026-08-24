{ lib
, fetchPypi
, buildPythonPackage
, persistent
, zope-interface
, python
, setuptools
,
}:

buildPythonPackage rec {
  pname = "btrees";
  version = "6.3";
  pyproject = true;

  src = fetchPypi {
    inherit pname version;
    hash = "sha256-Fga9/6erKMaACYRUC2le7oSPbhWwFF2Fj/SwxiZOjtI=";
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
    maintainers = [ ];
  };
}


