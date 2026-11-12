{
  lib,
  buildPythonPackage,
  fetchFromGitHub,
  hatchling,
  defusedxml,
  prawcore,
  update-checker,
  websocket-client,
}:

buildPythonPackage (finalAttrs: {
  pname = "praw";
  version = "8.0.3";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "praw-dev";
    repo = "praw";
    tag = "v${finalAttrs.version}";
    hash = "sha256-sHY/wE944KcY7CE8V2bD3rsFrdbMxsWj+x39kdTJoxg=";
  };

  build-system = [ hatchling ];

  # upstream pins defusedxml==0.7.1
  pythonRelaxDeps = [ "defusedxml" ];

  dependencies = [
    defusedxml
    prawcore
    update-checker
    websocket-client
  ];

  pythonImportsCheck = [ "praw" ];

  meta = {
    description = "Python Reddit API wrapper";
    homepage = "https://praw.readthedocs.org/";
    license = lib.licenses.bsd2;
  };
})
