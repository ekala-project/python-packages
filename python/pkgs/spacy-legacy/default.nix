{
  lib,
  fetchPypi,
  buildPythonPackage,
  setuptools,
}:

buildPythonPackage rec {
  pname = "spacy-legacy";
  version = "3.0.12";
  pyproject = true;

  src = fetchPypi {
    inherit pname version;
    hash = "sha256-s31uDJtuHXyhz1vHFSq2SkxGcfWcha2vej/LhwNXp3Q=";
  };

  build-system = [ setuptools ];

  pythonImportsCheck = [ "spacy_legacy" ];

  meta = {
    description = "Legacy registered functions for spaCy backwards compatibility";
    homepage = "https://github.com/explosion/spacy-legacy";
    license = lib.licenses.asl20;
    maintainers = [ ];
  };
}
