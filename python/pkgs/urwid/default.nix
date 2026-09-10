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
  version = "4.1.2";
  pyproject = true;

  src = fetchPypi {
    inherit pname version;
    hash = "sha256-QL804H0FuC+zBggpJcQE+Pc4/Xbgr1SAEAXX86aa0Yo=";
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
