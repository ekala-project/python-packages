{
  lib,
  fetchPypi,
  buildPythonPackage,
  setuptools,
}:

buildPythonPackage rec {
  pname = "zope.deprecation";
  version = "6.0";
  pyproject = true;

  src = fetchPypi {
    pname = "zope_deprecation";
    inherit version;
    hash = "sha256-GHJ+vajmOm1L0oopDotGhS6fFEc967XMQKCi3M+t8V8=";
  };

  postPatch = ''
    substituteInPlace pyproject.toml \
      --replace-fail "setuptools ==" "setuptools >="
  '';

  build-system = [ setuptools ];

  pythonImportsCheck = [ "zope.deprecation" ];

  pythonNamespaces = [ "zope" ];

  meta = {
    description = "Zope Deprecation Infrastructure";
    homepage = "https://github.com/zopefoundation/zope.deprecation";
    license = lib.licenses.zpl21;
  };
}
