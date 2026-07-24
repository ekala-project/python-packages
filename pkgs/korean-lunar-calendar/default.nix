{
  lib,
  fetchPypi,
  buildPythonPackage,
  setuptools,
}:

buildPythonPackage rec {
  pname = "korean_lunar_calendar";
  version = "0.4.0";
  pyproject = true;

  src = fetchPypi {
    inherit pname version;
    hash = "sha256-vlbye8BZT9u997vgD1BKn5KaMeMRvX2buTVhtkWvrec=";
  };

  build-system = [ setuptools ];

  pythonImportsCheck = [ "korean_lunar_calendar" ];

  meta = {
    description = "Library to convert Korean lunar-calendar to Gregorian calendar";
    homepage = "https://github.com/usingsky/korean_lunar_calendar_py";
    license = lib.licenses.mit;
  };
}
