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
  version = "3.10.3";
  pyproject = true;

  src = fetchPypi {
    inherit (finalAttrs) pname version;
    hash = "sha256-u5MnpGHDgRwvpJAOA4QEAfISat+zDABygnxDO9JETqQ=";
  };

  build-system = [ setuptools ];

  patches = [
    # https://github.com/nltk/nltk/security/advisories/GHSA-jm6w-m3j8-898g
    # https://github.com/nltk/nltk/security/advisories/GHSA-469j-vmhf-r6v7
  ];

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
