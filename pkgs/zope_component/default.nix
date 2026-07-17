{
  lib,
  fetchPypi,
  buildPythonPackage,
  setuptools,
  zope_event,
  zope_hookable,
  zope_interface,
}:

buildPythonPackage rec {
  pname = "zope.component";
  version = "7.1";
  pyproject = true;

  src = fetchPypi {
    pname = "zope_component";
    inherit version;
    hash = "sha256-Gz4GZHqL08BxxrybgNcI3tEgvOmBGFwttWR/2aDVJ50=";
  };

  build-system = [ setuptools ];

  dependencies = [
    zope_event
    zope_hookable
    zope_interface
  ];

  pythonImportsCheck = [ "zope.component" ];

  pythonNamespaces = [ "zope" ];

  meta = {
    description = "Zope Component Architecture";
    homepage = "https://github.com/zopefoundation/zope.component";
    license = lib.licenses.zpl21;
  };
}
