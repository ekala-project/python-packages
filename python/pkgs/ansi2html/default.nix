{
  lib,
  buildPythonPackage,
  fetchPypi,
  setuptools,
  setuptools-scm,
}:

buildPythonPackage rec {
  pname = "ansi2html";
  version = "1.9.5";
  pyproject = true;

  src = fetchPypi {
    inherit pname version;
    hash = "sha256-rhfpLx1srA5n02fgf7C6iiPayPGT/F16jIpQ/l3dlaQ=";
  };

  build-system = [
    setuptools
    setuptools-scm
  ];

  pythonImportsCheck = [ "ansi2html" ];

  meta = {
    description = "Convert text with ANSI color codes to HTML";
    mainProgram = "ansi2html";
    homepage = "https://github.com/ralphbean/ansi2html";
    license = lib.licenses.lgpl3Plus;
  };
}
