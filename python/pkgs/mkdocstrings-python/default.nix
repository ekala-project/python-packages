{
  lib,
  buildPythonPackage,
  fetchFromGitHub,
  griffe,
  griffelib,
  mkdocs-autorefs,
  mkdocstrings,
  pdm-backend,
}:

buildPythonPackage (finalAttrs: {
  pname = "mkdocstrings-python";
  version = "2.0.8";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "mkdocstrings";
    repo = "python";
    tag = finalAttrs.version;
    hash = "sha256-k2SxIrwN1f1TNg7zu8Q/UUZOYNpIljTnVbfNOp+GbSg=";
  };

  build-system = [ pdm-backend ];

  dependencies = [
    griffe
    griffelib
    mkdocs-autorefs
    mkdocstrings
  ];
  pythonImportsCheck = [ "mkdocstrings_handlers" ];
  meta = {
    description = "Python handler for mkdocstrings";
    homepage = "https://github.com/mkdocstrings/python";
    license = lib.licenses.isc;
  };
})
