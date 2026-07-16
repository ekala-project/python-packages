{
  lib,
  buildPythonPackage,
  fetchPypi,

  # build-system
  setuptools-scm,

  # dependencies
  autocommand,
  jaraco-context,
  jaraco-functools,
  inflect,
}:

buildPythonPackage rec {
  pname = "jaraco-text";
  version = "4.0.0";
  pyproject = true;

  src = fetchPypi {
    pname = "jaraco_text";
    inherit version;
    hash = "sha256-W3H+zqaatvk51MkGwE/uHtp2UA0WQRF99uxFuGXxDbA=";
  };

  build-system = [ setuptools-scm ];

  dependencies = [
    autocommand
    jaraco-context
    jaraco-functools
    inflect
  ];

  pythonNamespaces = [ "jaraco" ];

  pythonImportsCheck = [ "jaraco.text" ];

  meta = {
    homepage = "https://github.com/jaraco/jaraco.text";
    description = "Module for text manipulation";
    license = lib.licenses.mit;
  };
}
