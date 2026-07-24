{
  lib,
  fetchPypi,
  buildPythonPackage,
  setuptools,
  zope_i18nmessageid,
  zope_interface,
  zope_schema,
}:

buildPythonPackage rec {
  pname = "zope.configuration";
  version = "7.1";
  pyproject = true;

  src = fetchPypi {
    pname = "zope_configuration";
    inherit version;
    hash = "sha256-WvUc77TcxmBT5Uz+zjhIP7WTqBvhAQw4WH26kcnRVKw=";
  };

  build-system = [ setuptools ];

  dependencies = [
    zope_i18nmessageid
    zope_interface
    zope_schema
  ];

  pythonImportsCheck = [ "zope.configuration" ];

  pythonNamespaces = [ "zope" ];

  meta = {
    description = "Zope Configuration Markup Language (ZCML)";
    homepage = "https://github.com/zopefoundation/zope.configuration";
    license = lib.licenses.zpl21;
  };
}
