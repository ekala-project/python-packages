{
  lib,
  buildPythonPackage,
  fetchFromGitHub,
  # build-system
  setuptools,
}:

buildPythonPackage (finalAttrs: {
  pname = "pylatexenc";
  version = "2.11";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "phfaist";
    repo = "pylatexenc";
    tag = "v${finalAttrs.version}";
    hash = "sha256-Zv3Sjx0YpSCnoHHf3CSiGaFMS7FNgUUwvIxNX/k9tOg=";
  };

  build-system = [ setuptools ];

  pythonImportsCheck = [ "pylatexenc" ];

  meta = {
    description = "Simple LaTeX parser providing latex-to-unicode and unicode-to-latex conversion";
    homepage = "https://pylatexenc.readthedocs.io";
    license = lib.licenses.mit;
  };
})
