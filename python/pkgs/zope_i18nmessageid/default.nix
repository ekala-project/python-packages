{
  lib,
  fetchPypi,
  buildPythonPackage,
  setuptools,
  zope_interface,
}:

buildPythonPackage (finalAttrs: {
  pname = "zope.i18nmessageid";
  version = "8.4";
  pyproject = true;

  src = fetchPypi {
    pname = "zope_i18nmessageid";
    inherit (finalAttrs) version;
    hash = "sha256-9rNsN1O3G76SKOvkSiZXcm6I0tXuQ5Y1Df2Mn+bP3sE=";
  };

  build-system = [ setuptools ];

  dependencies = [
    zope_interface
  ];

  pythonImportsCheck = [ "zope.i18nmessageid" ];

  pythonNamespaces = [ "zope" ];

  meta = {
    description = "Message Identifiers for internationalization";
    homepage = "https://github.com/zopefoundation/zope.i18nmessageid";
    license = lib.licenses.zpl21;
  };
})
