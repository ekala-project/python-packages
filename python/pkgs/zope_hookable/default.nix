{
  lib,
  fetchPypi,
  buildPythonPackage,
  setuptools,
}:

buildPythonPackage rec {
  pname = "zope.hookable";
  version = "8.2";
  pyproject = true;

  src = fetchPypi {
    pname = "zope_hookable";
    inherit version;
    hash = "sha256-QvEyYXaAEMAAMehApWHi5e4lHxUJ+ouEF4lA6aNoyzM=";
  };

  build-system = [ setuptools ];

  pythonImportsCheck = [ "zope.hookable" ];

  pythonNamespaces = [ "zope" ];

  meta = {
    description = "Supports the efficient creation of hookable objects";
    homepage = "https://github.com/zopefoundation/zope.hookable";
    license = lib.licenses.zpl21;
  };
}
