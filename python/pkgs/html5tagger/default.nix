{
  lib,
  buildPythonPackage,
  fetchPypi,

  # build-system
  hatchling,
  hatch-vcs,
}:

buildPythonPackage (finalAttrs: {
  pname = "html5tagger";
  version = "2.0.0";
  pyproject = true;

  src = fetchPypi {
    inherit (finalAttrs) pname version;
    hash = "sha256-De48kFREOTDpoyJe3MgQtt92wK6r/uRj6UN6kKGsFiQ=";
  };

  build-system = [
    hatchling
    hatch-vcs
  ];

  pythonImportsCheck = [ "html5tagger" ];

  meta = {
    description = "Create HTML documents from Python";
    homepage = "https://github.com/sanic-org/html5tagger";
    license = lib.licenses.unlicense;
  };
})
