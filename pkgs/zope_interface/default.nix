{
  lib,
  fetchPypi,
  buildPythonPackage,
  setuptools,
}:

buildPythonPackage rec {
  pname = "zope.interface";
  version = "8.5";
  pyproject = true;

  src = fetchPypi {
    pname = "zope_interface";
    inherit version;
    hash = "sha256-ejuhxYd/Dz45BrAt33k6vtK+zClIEWQUzg4d2CC2jW0=";
  };

  build-system = [ setuptools ];

  pythonImportsCheck = [ "zope.interface" ];

  pythonNamespaces = [ "zope" ];

  meta = {
    description = "Implementation of object interfaces, a mechanism for labeling objects as conforming to a given API or contract";
    homepage = "https://github.com/zopefoundation/zope.interface";
    license = lib.licenses.zpl21;
  };
}
