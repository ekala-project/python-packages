{
  lib,
  fetchPypi,
  buildPythonPackage,
  setuptools,
}:

buildPythonPackage rec {
  pname = "zope.event";
  version = "6.2";
  pyproject = true;

  src = fetchPypi {
    pname = "zope_event";
    inherit version;
    hash = "sha256-uX1dYycGfua538vfYGremt5wmR4ZwWLoCOo55fzw+NM=";
  };

  build-system = [ setuptools ];

  pythonImportsCheck = [ "zope.event" ];

  pythonNamespaces = [ "zope" ];

  meta = {
    description = "Event publishing system";
    homepage = "https://github.com/zopefoundation/zope.event";
    license = lib.licenses.zpl21;
  };
}
