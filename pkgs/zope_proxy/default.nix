{
  lib,
  fetchPypi,
  buildPythonPackage,
  setuptools,
  zope-interface,
}:

buildPythonPackage rec {
  pname = "zope.proxy";
  version = "7.1";
  pyproject = true;

  src = fetchPypi {
    pname = "zope_proxy";
    inherit version;
    hash = "sha256-MqJMOYZ64aTWOyTmTMyzjpy/k0WzCdLW496sluGQWxw=";
  };

  build-system = [ setuptools ];

  dependencies = [ zope-interface ];

  doCheck = false;

  pythonImportsCheck = [ "zope.proxy" ];

  pythonNamespaces = [ "zope" ];

  meta = {
    description = "Generic Transparent Proxies";
    homepage = "https://github.com/zopefoundation/zope.proxy";
    license = lib.licenses.zpl21;
  };
}
