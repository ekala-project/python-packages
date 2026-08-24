{
  lib,
  buildPythonPackage,
  fetchFromGitHub,
  fetchpatch,
  setuptools,
  six,
}:

buildPythonPackage rec {
  pname = "warcio";
  version = "1.7.5";
  format = "setuptools";

  src = fetchFromGitHub {
    owner = "webrecorder";
    repo = "warcio";
    tag = "v${version}"; # Repo has no git tags, see https://github.com/webrecorder/warcio/issues/126
    hash = "sha256-i1bVbXf1RQoWCADFwlVEnFhb3sVZ91vijUtzVLWMc2Q=";
  };

  patches = [
    (fetchpatch {
      # Add offline mode to skip tests that require an internet connection, https://github.com/webrecorder/warcio/pull/135
      name = "add-offline-option.patch";
      url = "https://github.com/webrecorder/warcio/pull/135/commits/2546fe457c57ab0b391764a4ce419656458d9d07.patch";
      hash = "sha256-3izm9LvAeOFixiIUUqmd5flZIxH92+NxL7jeu35aObQ=";
    })
  ];

  propagatedBuildInputs = [
    six
    setuptools
  ];

  pythonImportsCheck = [ "warcio" ];

  meta = {
    description = "Streaming WARC/ARC library for fast web archive IO";
    mainProgram = "warcio";
    homepage = "https://github.com/webrecorder/warcio";
    license = lib.licenses.asl20;
    maintainers = [ ];
  };
}
