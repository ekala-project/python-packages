{
  lib,
  buildPythonPackage,
  fetchPypi,
  setuptools,
  setuptools-scm,
}:

buildPythonPackage rec {
  pname = "ansi2html";
  version = "1.9.2";
  pyproject = true;

  src = fetchPypi {
    inherit pname version;
    hash = "sha256-NFO/h1NdN7gnsFJF+qp1bbq07D1pkl41K2MZw8lVwKU=";
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
