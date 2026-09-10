{
  lib,
  fetchPypi,
  buildPythonPackage,
  setuptools,
  zope_interface,
}:

buildPythonPackage rec {
  pname = "zope.proxy";
  version = "7.3";
  pyproject = true;

  src = fetchPypi {
    pname = "zope_proxy";
    inherit version;
    hash = "sha256-osAP+E1Ba1AIu83XM364AK3ovAgzEui14OzX0MDRHPY=";
  };

  build-system = [ setuptools ];

  dependencies = [ zope_interface ];

  pythonImportsCheck = [ "zope.proxy" ];

  pythonNamespaces = [ "zope" ];

  meta = {
    description = "Generic Transparent Proxies";
    homepage = "https://github.com/zopefoundation/zope.proxy";
    license = lib.licenses.zpl21;
  };
}
