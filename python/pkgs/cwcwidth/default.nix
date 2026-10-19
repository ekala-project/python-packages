{
  lib,
  fetchPypi,
  buildPythonPackage,
  cython,
  setuptools,
}:

buildPythonPackage (finalAttrs: {
  pname = "cwcwidth";
  version = "0.1.12";
  pyproject = true;

  src = fetchPypi {
    inherit (finalAttrs) pname version;
    hash = "sha256-v8FlMdEkbdJVjrmzpjqjepl4ZyuVaGDcVCbaI0Pr82Y=";
  };

  build-system = [
    cython
    setuptools
  ];

  pythonImportsCheck = [ "cwcwidth" ];

  meta = {
    description = "Python bindings for wc(s)width";
    homepage = "https://github.com/sebastinas/cwcwidth";
    license = lib.licenses.mit;
  };
})
