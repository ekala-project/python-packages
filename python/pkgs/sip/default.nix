{
  lib,
  buildPythonPackage,
  fetchPypi,
  setuptools,
  setuptools-scm,
  packaging,
}:

buildPythonPackage rec {
  pname = "sip";
  version = "6.15.1";
  pyproject = true;

  src = fetchPypi {
    inherit pname version;
    hash = "sha256-3C5YwXmKdOGzHCjoNzOYIv6PpVKIrjDomG6ygQDrylo=";
  };

  build-system = [
    setuptools
    setuptools-scm
  ];

  dependencies = [
    packaging
    setuptools
  ];

  # There aren't tests

  pythonImportsCheck = [ "sipbuild" ];

  meta = {
    description = "Creates C++ bindings for Python modules";
    homepage = "https://riverbankcomputing.com/";
    license = lib.licenses.gpl3Only;
    maintainers = [ ];
  };
}
