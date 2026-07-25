{
  lib,
  buildPythonPackage,
  fetchFromGitHub,
  setuptools,
  setuptools-scm,
  brotli,
  inflate64,
  multivolumefile,
  psutil,
  pybcj,
  pycryptodomex,
  pyppmd,
  pyzstd,
  texttable,
}:

buildPythonPackage rec {
  pname = "py7zr";
  version = "1.1.3";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "miurahr";
    repo = "py7zr";
    tag = "v${version}";
    hash = "sha256-/sorvv5/kwlY/DtxW33ytHhyrR06p6aNgGW9oH+lpUw=";
  };

  build-system = [
    setuptools
    setuptools-scm
  ];

  dependencies = [
    brotli
    inflate64
    multivolumefile
    psutil
    pybcj
    pycryptodomex
    pyppmd
    pyzstd
    texttable
  ];

  pythonRelaxDeps = [
    "pyppmd"
    "pybcj"
    "inflate64"
  ];
  pythonImportsCheck = [
    "py7zr"
  ];

  meta = {
    description = "7zip in Python 3 with ZStandard, PPMd, LZMA2, LZMA1, Delta, BCJ, BZip2";
    homepage = "https://github.com/miurahr/py7zr";
    license = lib.licenses.gpl2Only;
    maintainers = [ ];
  };
}
