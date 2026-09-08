{
  lib,
  buildPythonPackage,
  fetchFromGitHub,
}:

buildPythonPackage rec {
  pname = "pylatexenc";
  version = "2.11";
  format = "setuptools";

  src = fetchFromGitHub {
    owner = "phfaist";
    repo = "pylatexenc";
    tag = "v${version}";
    hash = "sha256-Zv3Sjx0YpSCnoHHf3CSiGaFMS7FNgUUwvIxNX/k9tOg=";
  };

  pythonImportsCheck = [ "pylatexenc" ];

  meta = {
    description = "Simple LaTeX parser providing latex-to-unicode and unicode-to-latex conversion";
    homepage = "https://pylatexenc.readthedocs.io";
    license = lib.licenses.mit;
  };
}
