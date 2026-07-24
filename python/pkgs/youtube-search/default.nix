{
  lib,
  fetchPypi,
  buildPythonPackage,
  setuptools,
  requests,
}:

buildPythonPackage rec {
  pname = "youtube_search";
  version = "2.2.0";
  pyproject = true;

  src = fetchPypi {
    inherit pname version;
    hash = "sha256-U5inzWXZt1qLrCfvaJ7ARKurPL+h8g0Z2wJ3ZZrHDZg=";
  };

  build-system = [ setuptools ];

  dependencies = [ requests ];

  pythonImportsCheck = [ "youtube_search" ];

  meta = {
    description = "Tool for searching for youtube videos";
    homepage = "https://github.com/joetats/youtube_search";
    license = lib.licenses.mit;
  };
}
