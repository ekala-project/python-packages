{
  lib,
  buildPythonPackage,
  fetchPypi,
  fetchpatch,
  # build-system
  setuptools,
  click,
  defusedxml,
  joblib,
  regex,
  tqdm,
}:

buildPythonPackage (finalAttrs: {
  pname = "nltk";
  version = "3.10.4";
  pyproject = true;

  src = fetchPypi {
    inherit (finalAttrs) pname version;
    hash = "sha256-RGefTpIgq/1JbSyM2yL4QlzL5VdgT5qlysscRAA9q8E=";
  };

  build-system = [ setuptools ];

  dependencies = [
    click
    defusedxml
    joblib
    regex
    tqdm
  ];

  pythonImportsCheck = [ "nltk" ];

  meta = {
    description = "Natural Language Processing ToolKit";
    mainProgram = "nltk";
    homepage = "http://nltk.org/";
    license = lib.licenses.asl20;
  };
})
