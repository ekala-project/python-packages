{
  lib,
  buildPythonPackage,
  fetchPypi,
  setuptools,
  setuptools-scm,
  typing-extensions,
}:

buildPythonPackage rec {
  pname = "typeguard";
  version = "4.6.0";
  pyproject = true;

  src = fetchPypi {
    inherit pname version;
    hash = "sha256-50FPCRETF94+M13pLNOXxcDKALHMFnbeEuHURKebPyE=";
  };

  build-system = [
    setuptools
    setuptools-scm
  ];

  dependencies = [
    typing-extensions
  ];

  pythonImportsCheck = [ "typeguard" ];

  meta = {
    description = "This library provides run-time type checking for functions defined with argument type annotations";
    homepage = "https://github.com/agronholm/typeguard";
    license = lib.licenses.mit;
  };
}
