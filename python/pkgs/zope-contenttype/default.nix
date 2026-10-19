{
  lib,
  fetchPypi,
  buildPythonPackage,
  setuptools,
}:

buildPythonPackage (finalAttrs: {
  pname = "zope.contenttype";
  version = "6.0";
  pyproject = true;

  src = fetchPypi {
    pname = "zope_contenttype";
    inherit (finalAttrs) version;
    hash = "sha256-/OWKMz2blKEo3ajO2kdcl20Toa+KOxI7bHaOr+HpL2M=";
  };

  postPatch = ''
    substituteInPlace pyproject.toml \
      --replace-fail "setuptools ==" "setuptools >="
  '';

  build-system = [ setuptools ];

  pythonImportsCheck = [ "zope.contenttype" ];

  pythonNamespaces = [ "zope" ];

  meta = {
    description = "Utility module for content-type (MIME type) handling";
    homepage = "https://github.com/zopefoundation/zope.contenttype";
    license = lib.licenses.zpl21;
  };
})
