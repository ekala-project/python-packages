{
  lib,
  fetchPypi,
  buildPythonPackage,
  setuptools,
}:

buildPythonPackage rec {
  pname = "zope.testing";
  version = "6.2";
  pyproject = true;

  src = fetchPypi {
    pname = "zope_testing";
    inherit version;
    hash = "sha256-DeR/PBqWy+wVrnoWB9WhQuw55QFygFVDQ1jC9M8PIak=";
  };

  build-system = [ setuptools ];

  pythonImportsCheck = [ "zope.testing" ];

  pythonNamespaces = [ "zope" ];

  meta = {
    description = "Zope testing helpers";
    homepage = "https://github.com/zopefoundation/zope.testing";
    license = lib.licenses.zpl21;
  };
}
