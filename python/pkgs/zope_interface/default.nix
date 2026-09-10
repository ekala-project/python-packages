{
  lib,
  fetchPypi,
  buildPythonPackage,
  setuptools,
}:

buildPythonPackage rec {
  pname = "zope.interface";
  version = "8.6";
  pyproject = true;

  src = fetchPypi {
    pname = "zope_interface";
    inherit version;
    hash = "sha256-tA75tIc6+10N7AK40t/eHPGMcjN7YMmctzWWHgusBcA=";
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
