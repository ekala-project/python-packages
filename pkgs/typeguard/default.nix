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
  version = "4.5.2";
  pyproject = true;

  src = fetchPypi {
    inherit pname version;
    hash = "sha256-WhbcrCNQIDkpnJfIlBZRvDPX6ozEsvfWu7G1KPbupCM=";
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
