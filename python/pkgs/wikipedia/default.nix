{
  lib,
  buildPythonPackage,
  fetchPypi,

  # build-system
  setuptools,

  # dependencies
  beautifulsoup4,
  requests,
}:

buildPythonPackage rec {
  pname = "wikipedia";
  version = "1.4.0";
  pyproject = true;

  src = fetchPypi {
    inherit pname version;
    hash = "sha256-2w+tGCn91EGxhSMG6YVjmCBNwHhtKZbdLgyLuOJhM7I=";
  };

  build-system = [ setuptools ];

  dependencies = [
    beautifulsoup4
    requests
  ];

  pythonImportsCheck = [ "wikipedia" ];

  meta = {
    description = "Pythonic wrapper for the Wikipedia API";
    homepage = "https://github.com/goldsmith/Wikipedia";
    license = lib.licenses.mit;
  };
}
