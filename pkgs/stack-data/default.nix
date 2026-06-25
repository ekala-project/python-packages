{
  lib,
  buildPythonPackage,
  fetchFromGitHub,
  asttokens,
  executing,
  pure-eval,
  setuptools,
  setuptools-scm,
  wheel,
}:

buildPythonPackage rec {
  pname = "stack-data";
  version = "0.6.3";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "alexmojaki";
    repo = "stack_data";
    tag = "v${version}";
    hash = "sha256-dmBhfCg60KX3gWp3k1CGRxW14z3BLlair0PjLW9HFYo=";
  };

  build-system = [
    setuptools
    setuptools-scm
    wheel
  ];

  dependencies = [
    asttokens
    executing
    pure-eval
  ];

  pythonImportsCheck = [ "stack_data" ];

  meta = {
    description = "Extract data from stack frames and tracebacks";
    homepage = "https://github.com/alexmojaki/stack_data/";
    license = lib.licenses.mit;
    mainProgram = "stack-data";
  };
}
