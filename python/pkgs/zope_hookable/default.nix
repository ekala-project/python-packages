{
  lib,
  fetchPypi,
  buildPythonPackage,
  setuptools,
}:

buildPythonPackage (finalAttrs: {
  pname = "zope.hookable";
  version = "8.3";
  pyproject = true;

  src = fetchPypi {
    pname = "zope_hookable";
    inherit (finalAttrs) version;
    hash = "sha256-oFyfiks/IRhMxCPa1hFjQsHFmBjuseTL34QfQkOVLU8=";
  };

  build-system = [ setuptools ];

  pythonImportsCheck = [ "zope.hookable" ];

  pythonNamespaces = [ "zope" ];

  meta = {
    description = "Supports the efficient creation of hookable objects";
    homepage = "https://github.com/zopefoundation/zope.hookable";
    license = lib.licenses.zpl21;
  };
})
