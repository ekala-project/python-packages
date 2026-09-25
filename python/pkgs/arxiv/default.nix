{
  lib,
  buildPythonPackage,
  fetchFromGitHub,

  # build-system
  hatchling,
  hatch-vcs,

  # dependencies
  feedparser,
  lxml,
  requests,

  # tests
  mock,
}:
buildPythonPackage rec {
  pname = "arxiv";
  version = "4.0.1";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "lukasschwab";
    repo = "arxiv.py";
    tag = version;
    hash = "sha256-nZhi0dPEiv6VLpacvcGvZhvvDkLalrs4IJvMVzb5MJI=";
  };

  build-system = [
    hatchling
    hatch-vcs
  ];

  dependencies = [
    feedparser
    lxml
    requests
  ];
  pythonImportsCheck = [ "arxiv" ];

  meta = {
    description = "Python wrapper for the arXiv API";
    homepage = "https://github.com/lukasschwab/arxiv.py";
    license = lib.licenses.mit;
  };
}
