{
  lib,
  buildPythonPackage,
  fetchFromGitHub,
  setuptools,
  click,
  icalendar,
  tzdata,
}:

buildPythonPackage rec {
  pname = "x-wr-timezone";
  version = "2.0.1";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "niccokunzmann";
    repo = "x-wr-timezone";
    tag = "v${version}";
    hash = "sha256-Llpe3Z0Yfd0vRgx95D4YVrnNJk0g/VqPuNvtUrUpFk0=";
  };

  build-system = [ setuptools ];

  dependencies = [
    click
    icalendar
    tzdata
  ];

  meta = {
    description = "Convert calendars using X-WR-TIMEZONE to standard ones";
    homepage = "https://github.com/niccokunzmann/x-wr-timezone";
    license = lib.licenses.lgpl3Plus;
    maintainers = [ ];
  };
}
