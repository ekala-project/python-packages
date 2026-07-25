{
  lib,
  buildPythonPackage,
  fetchFromGitHub,
  griffe,
  mkdocs-autorefs,
  mkdocstrings,
  pdm-backend,
}:

buildPythonPackage (finalAttrs: {
  pname = "mkdocstrings-python";
  version = "2.0.2";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "mkdocstrings";
    repo = "python";
    tag = finalAttrs.version;
    hash = "sha256-MCR304sOqlS4azZOoNa4klITDdr+bD8N6wEZBuHhZms=";
  };

  build-system = [ pdm-backend ];

  dependencies = [
    griffe
    mkdocs-autorefs
    mkdocstrings
  ];
  pythonImportsCheck = [ "mkdocstrings_handlers" ];
  meta = {
    description = "Python handler for mkdocstrings";
    homepage = "https://github.com/mkdocstrings/python";
    license = lib.licenses.isc;
    maintainers = [ ];
  };
})
