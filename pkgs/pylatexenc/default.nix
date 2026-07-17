{
  lib,
  buildPythonPackage,
  fetchFromGitHub,
}:

buildPythonPackage rec {
  pname = "pylatexenc";
  version = "2.10";
  format = "setuptools";

  src = fetchFromGitHub {
    owner = "phfaist";
    repo = "pylatexenc";
    tag = "v${version}";
    hash = "sha256-3Ho04qrmCtmmrR+BUJNbtdCZcK7lXhUGJjm4yfCTUkM=";
  };

  pythonImportsCheck = [ "pylatexenc" ];

  meta = {
    description = "Simple LaTeX parser providing latex-to-unicode and unicode-to-latex conversion";
    homepage = "https://pylatexenc.readthedocs.io";
    license = lib.licenses.mit;
  };
}
