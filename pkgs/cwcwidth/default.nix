{
  lib,
  fetchPypi,
  buildPythonPackage,
  cython,
  setuptools,
}:

buildPythonPackage rec {
  pname = "cwcwidth";
  version = "0.1.12";
  pyproject = true;

  src = fetchPypi {
    inherit pname version;
    hash = "sha256-v8FlMdEkbdJVjrmzpjqjepl4ZyuVaGDcVCbaI0Pr82Y=";
  };

  build-system = [
    cython
    setuptools
  ];

  doCheck = false;

  pythonImportsCheck = [ "cwcwidth" ];

  meta = {
    description = "Python bindings for wc(s)width";
    homepage = "https://github.com/sebastinas/cwcwidth";
    license = lib.licenses.mit;
  };
}
