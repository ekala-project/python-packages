{
  lib,
  fetchFromGitHub,
  buildPythonPackage,
  setuptools,
  wandb,
  wasabi,
}:

buildPythonPackage (finalAttrs: {
  pname = "spacy-loggers";
  version = "1.0.5";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "explosion";
    repo = "spacy-loggers";
    tag = "v${finalAttrs.version}";
    hash = "sha256-Kl8FSs+sbIF2Ml5AJhP5aY7lWnDLqUr7QBAq+63SW5Q=";
  };

  build-system = [
    setuptools
  ];

  dependencies = [
    wandb
    wasabi
  ];

  pythonImportsCheck = [ "spacy_loggers" ];

  meta = {
    description = "Logging utilities for spaCy";
    homepage = "https://github.com/explosion/spacy-loggers";
    license = lib.licenses.mit;
    maintainers = [ ];
  };
})
