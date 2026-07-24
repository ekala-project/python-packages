{
  lib,
  fetchPypi,
  buildPythonPackage,
  setuptools,
  zope_event,
  zope_interface,
}:

buildPythonPackage rec {
  pname = "zope.schema";
  version = "8.1";
  pyproject = true;

  src = fetchPypi {
    pname = "zope_schema";
    inherit version;
    hash = "sha256-LZ+qf5Gnvwn8qywDnZGC/MnOcELcd+GNPfJ3kEruCUg=";
  };

  postPatch = ''
    substituteInPlace pyproject.toml \
      --replace-fail "setuptools ==" "setuptools >="
  '';

  build-system = [ setuptools ];

  dependencies = [
    zope_event
    zope_interface
  ];

  pythonImportsCheck = [ "zope.schema" ];

  pythonNamespaces = [ "zope" ];

  meta = {
    description = "zope.interface extension for defining data schemas";
    homepage = "https://github.com/zopefoundation/zope.schema";
    license = lib.licenses.zpl21;
  };
}
