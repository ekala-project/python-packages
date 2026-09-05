{
  lib,
  buildPythonPackage,
  fetchFromGitHub,
  setuptools,
  python-dateutil,
  pytz,
  regex,
  tzlocal,
  hijridate,
  convertdate,
  numpy,
  langdetect,
}:

buildPythonPackage rec {
  pname = "dateparser";
  version = "1.4.3";

  pyproject = true;

  src = fetchFromGitHub {
    owner = "scrapinghub";
    repo = "dateparser";
    tag = "v${version}";
    hash = "sha256-HaT+8aJ1qJ0irbDsv0nGn5Ln58lxfIIO6MnV+iOdEPM=";
  };

  build-system = [ setuptools ];

  dependencies = [
    python-dateutil
    pytz
    regex
    tzlocal
  ];

  optional-dependencies = {
    calendars = [
      hijridate
      convertdate
    ];
    langdetect = [ langdetect ];
  };
  pythonImportsCheck = [ "dateparser" ];

  meta = {
    description = "Date parsing library designed to parse dates from HTML pages";
    homepage = "https://github.com/scrapinghub/dateparser";
    license = lib.licenses.bsd3;
    mainProgram = "dateparser-download";
    maintainers = [ ];
  };
}
