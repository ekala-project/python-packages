{
  lib,
  fetchPypi,
  buildPythonPackage,
  setuptools,
  zope_proxy,
}:

buildPythonPackage (finalAttrs: {
  pname = "zope.deferredimport";
  version = "6.1.1";
  pyproject = true;

  src = fetchPypi {
    pname = "zope_deferredimport";
    inherit (finalAttrs) version;
    hash = "sha256-lZBS0/XgXEx4VLiHFpcZheCxtEpcAWPhLZoLkOTjtsw=";
  };

  build-system = [ setuptools ];

  dependencies = [ zope_proxy ];

  pythonImportsCheck = [ "zope.deferredimport" ];

  pythonNamespaces = [ "zope" ];

  meta = {
    description = "Allows you to perform imports names that will only be resolved when used in the code";
    homepage = "https://github.com/zopefoundation/zope.deferredimport";
    license = lib.licenses.zpl21;
  };
})
