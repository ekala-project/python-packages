{
  lib,
  buildPythonPackage,
  fetchFromGitHub,
  isPy3k,
  setuptools,
  colorama,
  texttable,
  tqdm,
  certifi,
  housekeeping,
  puremagic,
  pydiffx,
  typing-extensions,
  importlib-metadata,
  importlib-resources,
  packaging,
}:

buildPythonPackage rec {
  pname = "rbtools";
  version = "5.2.1";
  pyproject = true;
  disabled = !isPy3k;

  src = fetchFromGitHub {
    owner = "reviewboard";
    repo = "rbtools";
    tag = "release-${version}";
    hash = "sha256-Ci9lHlP2X95y7ldHBbqb5qWozPj3TJ0AxeVhqzVsdFA=";
  };

  build-system = [ setuptools ];

  dependencies = [
    texttable
    tqdm
    colorama
    certifi
    housekeeping
    puremagic
    pydiffx
    typing-extensions
    importlib-metadata
    importlib-resources
    packaging
  ];

  pythonRelaxDeps = [ "pydiffx" ];

  meta = {
    homepage = "https://www.reviewboard.org/docs/rbtools/dev/";
    description = "RBTools is a set of command line tools for working with Review Board and RBCommons";
    mainProgram = "rbt";
    license = lib.licenses.mit;
    maintainers = [ ];
  };
}
