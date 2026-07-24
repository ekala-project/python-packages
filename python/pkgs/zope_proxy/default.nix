{
  lib,
  fetchPypi,
  buildPythonPackage,
  setuptools,
  zope_interface,
}:

buildPythonPackage rec {
  pname = "zope.proxy";
  version = "7.2";
  pyproject = true;

  src = fetchPypi {
    pname = "zope_proxy";
    inherit version;
    hash = "sha256-pE6jTO1DPcpmW16MMA6D5A0q5oIWaPV67zjBFZPlb1g=";
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
