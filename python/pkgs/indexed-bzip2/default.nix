{
  lib,
  buildPythonPackage,
  cython,
  fetchPypi,
  setuptools,
}:

buildPythonPackage (finalAttrs: {
  pname = "indexed_bzip2";
  version = "1.7.0";
  pyproject = true;

  src = fetchPypi {
    inherit (finalAttrs) pname version;
    hash = "sha256-P8347fXYRsF9cgDAJNRHWBoHI7VXRtb9zGEIVqwz1Cs=";
  };

  # Upstream pins setuptools < 72 and cython < 3.1 for issues not affecting us
  postPatch = ''
    substituteInPlace pyproject.toml \
      --replace-fail '"setuptools >= 61.2, < 72"' '"setuptools >= 61.2"' \
      --replace-fail '"cython >= 0.29.24, < 3.1"' '"cython >= 0.29.24"'
  '';

  nativeBuildInputs = [
    cython
    setuptools
  ];

  # has no tests

  pythonImportsCheck = [ "indexed_bzip2" ];

  meta = {
    description = "Python library for parallel decompression and seeking within compressed bzip2 files";
    mainProgram = "ibzip2";
    homepage = "https://github.com/mxmlnkn/indexed_bzip2";
    license = lib.licenses.mit; # dual MIT and asl20, https://internals.rust-lang.org/t/rationale-of-apache-dual-licensing/8952
  };
})
