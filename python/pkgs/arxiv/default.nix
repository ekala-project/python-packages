{
  lib,
  buildPythonPackage,
  fetchFromGitHub,

  # build-system
  hatchling,
  hatch-vcs,

  # dependencies
  feedparser,
  requests,

  # tests
  mock,
}:
buildPythonPackage rec {
  pname = "arxiv";
  version = "3.0.0";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "lukasschwab";
    repo = "arxiv.py";
    tag = version;
    hash = "sha256-o2Vqkr5Tlx7Iv1NEWDSU8X6hvlGUslIl4oHiRQNGdqI=";
  };

  build-system = [
    hatchling
    hatch-vcs
  ];

  dependencies = [
    feedparser
    requests
  ];
  pythonImportsCheck = [ "arxiv" ];

  meta = {
    description = "Python wrapper for the arXiv API";
    homepage = "https://github.com/lukasschwab/arxiv.py";
    license = lib.licenses.mit;
    maintainers = [ lib.maintainers.octvs ];
  };
}
