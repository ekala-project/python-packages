{
  lib,
  buildPythonPackage,
  fetchPypi,

  # build-system
  setuptools,

  # dependencies
  redis,
  requests,
  urllib3,
}:

buildPythonPackage rec {
  pname = "spotipy";
  version = "2.26.0";
  pyproject = true;

  src = fetchPypi {
    inherit pname version;
    hash = "sha256-32ol2CCQcu+ozqFlYI7mRIhOOAT4dittjgbKGlx/imM=";
  };

  build-system = [ setuptools ];

  dependencies = [
    redis
    requests
    urllib3
  ];

  pythonImportsCheck = [
    "spotipy"
    "spotipy.oauth2"
  ];

  meta = {
    description = "Library for the Spotify Web API";
    homepage = "https://spotipy.readthedocs.org/";
    license = lib.licenses.mit;
  };
}
