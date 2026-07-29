{
  lib,
  buildPythonPackage,
  fetchFromGitHub,
  logical-unification,
  setuptools,
  setuptools-scm,
}:

buildPythonPackage rec {
  pname = "cons";
  version = "0.4.7";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "pythological";
    repo = "python-cons";
    tag = "v${version}";
    hash = "sha256-BS7lThnv+dxtztvw2aRhQa8yx2cRfrZLiXjcwvZ8QR0=";
  };

  build-system = [
    setuptools
    setuptools-scm
  ];

  dependencies = [ logical-unification ];
  pythonImportsCheck = [ "cons" ];

  meta = {
    description = "Implementation of Lisp/Scheme-like cons in Python";
    homepage = "https://github.com/pythological/python-cons";
    license = lib.licenses.gpl3Only;
    maintainers = [ ];
  };
}
