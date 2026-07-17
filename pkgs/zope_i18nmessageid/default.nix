{
  lib,
  fetchPypi,
  buildPythonPackage,
  setuptools,
  zope_interface,
}:

buildPythonPackage rec {
  pname = "zope.i18nmessageid";
  version = "8.2";
  pyproject = true;

  src = fetchPypi {
    pname = "zope_i18nmessageid";
    inherit version;
    hash = "sha256-hSBPskQPa9CqxS9qRinrRPj+Vp3NnKpYKgo53xijCBc=";
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
}
