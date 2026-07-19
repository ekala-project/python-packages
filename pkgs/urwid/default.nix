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
  version = "3.0.5";
  pyproject = true;

  src = fetchPypi {
    inherit pname version;
    hash = "sha256-JL4n/6/baMCc2V3CG2DM/QKEMyCyXOX+7hcIs0+tWiM=";
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
