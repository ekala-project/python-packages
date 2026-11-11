{
  lib,
  fetchPypi,
  buildPythonPackage,
  setuptools,
  setuptools-scm,
  typing-extensions,
  wcwidth,
}:

buildPythonPackage (finalAttrs: {
  pname = "urwid";
  version = "5.1.2";
  pyproject = true;

  src = fetchPypi {
    inherit (finalAttrs) pname version;
    hash = "sha256-ufQiHGuct3ISCMzLFhTScuRxWEHfiS36pxkG8un0l+w=";
  };

  build-system = [
    setuptools
    setuptools-scm
  ];

  dependencies = [
    typing-extensions
    wcwidth
  ];

  pythonImportsCheck = [ "urwid" ];

  meta = {
    description = "Full-featured console (xterm et al.) user interface library";
    homepage = "https://urwid.org/";
    license = lib.licenses.lgpl21Plus;
  };
})
