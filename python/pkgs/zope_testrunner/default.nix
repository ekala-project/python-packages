{
  lib,
  fetchPypi,
  buildPythonPackage,
  setuptools,
  zope_interface,
  zope_exceptions,
}:

buildPythonPackage (finalAttrs: {
  pname = "zope.testrunner";
  version = "8.3";
  pyproject = true;

  src = fetchPypi {
    pname = "zope_testrunner";
    inherit (finalAttrs) version;
    hash = "sha256-b++IEXMUZ2ZQgpFAwqkDj7egtG/XwBop3X8oQr/GFNc=";
  };

  postPatch = ''
    substituteInPlace pyproject.toml \
      --replace-fail "setuptools >= 78.1.1,< 82" "setuptools >= 78.1.1"
  '';

  build-system = [ setuptools ];

  dependencies = [
    zope_interface
    zope_exceptions
  ];

  pythonImportsCheck = [ "zope.testrunner" ];

  pythonNamespaces = [ "zope" ];

  meta = {
    description = "Flexible test runner with layer support";
    homepage = "https://github.com/zopefoundation/zope.testrunner";
    license = lib.licenses.zpl21;
  };
})
