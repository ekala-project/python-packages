{
  lib,
  buildPythonPackage,
  fetchPypi,
  setuptools,
  setuptools-scm,
  packaging,
}:

buildPythonPackage (finalAttrs: {
  pname = "sip";
  version = "6.17.3";
  pyproject = true;

  src = fetchPypi {
    inherit (finalAttrs) pname version;
    hash = "sha256-47XC0UKalvLh/CW2nUzrIyvIt/I5XoZMkEzsKJBWQrU=";
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
  };
})
