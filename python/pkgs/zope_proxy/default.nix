{
  lib,
  fetchPypi,
  buildPythonPackage,
  setuptools,
  zope_interface,
}:

buildPythonPackage (finalAttrs: {
  pname = "zope.proxy";
  version = "7.4";
  pyproject = true;

  src = fetchPypi {
    pname = "zope_proxy";
    inherit (finalAttrs) version;
    hash = "sha256-shpHiJCYoxoBn0SJpf3qZEm5NqNwFFGYmdsK2IY8SIE=";
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
})
