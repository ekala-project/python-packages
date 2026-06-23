{
  lib,
  buildPythonPackage,
  fetchPypi,
  setuptools,
  setuptools-scm,
  typing-extensions,
  glibcLocales,
  sphinxHook,
  sphinx-autodoc-typehints,
  sphinx-rtd-theme,
}:

buildPythonPackage rec {
  pname = "typeguard";
  version = "4.4.4";
  pyproject = true;

  src = fetchPypi {
    inherit pname version;
    hash = "sha256-On/S3/twXU0O+u1DBqcEyJud7oULaI8GCosWFaeeX3Q=";
  };

  outputs = [
    "out"
    "doc"
  ];

  build-system = [
    glibcLocales
    setuptools
    setuptools-scm
    sphinxHook
    sphinx-autodoc-typehints
    sphinx-rtd-theme
  ];

  dependencies = [
    typing-extensions
  ];

  env.LC_ALL = "en_US.utf-8";

  pythonImportsCheck = [ "typeguard" ];

  meta = {
    description = "This library provides run-time type checking for functions defined with argument type annotations";
    homepage = "https://github.com/agronholm/typeguard";
    license = lib.licenses.mit;
  };
}
