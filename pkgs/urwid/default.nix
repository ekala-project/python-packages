{
  lib,
  fetchPypi,
  buildPythonPackage,
  setuptools,
  setuptools-scm,
  typing-extensions,
  wcwidth,
}:

buildPythonPackage rec {
  pname = "urwid";
  version = "4.0.6";
  pyproject = true;

  src = fetchPypi {
    inherit pname version;
    hash = "sha256-/GZZ5qWnnyAPODM39kskkGvdHBliKnW1Nb8dB+kJirE=";
  };

  build-system = [
    setuptools
    setuptools-scm
  ];

  dependencies = [
    typing-extensions
    wcwidth
  ];

  doCheck = false;

  pythonImportsCheck = [ "urwid" ];

  meta = {
    description = "Full-featured console (xterm et al.) user interface library";
    homepage = "https://urwid.org/";
    license = lib.licenses.lgpl21Plus;
  };
}
