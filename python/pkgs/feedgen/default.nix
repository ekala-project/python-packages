{
  lib,
  buildPythonPackage,
  fetchPypi,
  setuptools,
  python-dateutil,
  lxml,
}:

buildPythonPackage rec {
  pname = "feedgen";
  version = "1.0.0";
  pyproject = true;

  src = fetchPypi {
    inherit pname version;
    hash = "sha256-2b1Rw7XpVqKlKZjDcIxNLHKfL8wxEYjh5dO5cmOTVGo=";
  };

  build-system = [ setuptools ];

  dependencies = [
    python-dateutil
    lxml
  ];

  pythonImportsCheck = [ "feedgen" ];

  meta = {
    description = "Python module to generate ATOM feeds, RSS feeds and Podcasts";
    homepage = "https://github.com/lkiesow/python-feedgen";
    license = lib.licenses.bsd2;
  };
}
