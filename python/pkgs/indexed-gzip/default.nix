{
  lib,
  buildPythonPackage,
  fetchPypi,
  setuptools,
  setuptools-scm,
  cython,
  zlib,
}:

buildPythonPackage rec {
  pname = "indexed_gzip";
  version = "1.10.3";
  pyproject = true;

  src = fetchPypi {
    inherit pname version;
    hash = "sha256-E0fztsVSLFxQ212eKAElfOqGY56HtGxmNfIgBe497SU=";
  };

  build-system = [
    cython
    setuptools
    setuptools-scm
  ];

  buildInputs = [ zlib ];

  # Too complicated to get to work, not a simple pytest call.

  pythonImportsCheck = [ "indexed_gzip" ];

  meta = {
    description = "Python library to seek within compressed gzip files";
    homepage = "https://github.com/pauldmccarthy/indexed_gzip";
    license = lib.licenses.zlib;
  };
}
