{
  lib,
  fetchPypi,
  buildPythonPackage,
  setuptools,
}:

buildPythonPackage (finalAttrs: {
  pname = "zope.hookable";
  version = "8.4";
  pyproject = true;

  src = fetchPypi {
    pname = "zope_hookable";
    inherit (finalAttrs) version;
    hash = "sha256-yg/689O7yoPpA3g5WrMb33xmvfPe1NeIzBxkURRqaew=";
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
