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
  version = "1.4.1";

  pyproject = true;

  src = fetchFromGitHub {
    owner = "scrapinghub";
    repo = "dateparser";
    tag = "v${version}";
    hash = "sha256-TA4GZb24++RF1sw4tECJF5UzouRCwwhPiim5z5/hMzU=";
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
