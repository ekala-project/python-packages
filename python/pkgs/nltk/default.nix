{
  lib,
  buildPythonPackage,
  fetchPypi,
  fetchpatch,
  click,
  defusedxml,
  joblib,
  regex,
  tqdm,
}:

buildPythonPackage rec {
  pname = "nltk";
  version = "3.10.3";
  format = "setuptools";

  src = fetchPypi {
    inherit pname version;
    hash = "sha256-u5MnpGHDgRwvpJAOA4QEAfISat+zDABygnxDO9JETqQ=";
  };

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
}
