{
  lib,
  buildPythonPackage,
  fetchFromGitHub,
  hatch-vcs,
  hatchling,
  icalendar,
  python-dateutil,
  tzdata,
  x-wr-timezone,
}:

buildPythonPackage rec {
  pname = "recurring-ical-events";
  version = "3.9.0";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "niccokunzmann";
    repo = "python-recurring-ical-events";
    tag = "v${version}";
    hash = "sha256-hBZg1u6JtWGC+l1D1M18al6OQ298Z76tkiqYrBQYIzQ=";
  };

  postPatch = ''
    substituteInPlace pyproject.toml \
      --replace 'dynamic = ["urls", "version"]' 'version = "${version}"'
  '';

  build-system = [
    hatch-vcs
    hatchling
  ];

  dependencies = [
    icalendar
    python-dateutil
    tzdata
    x-wr-timezone
  ];

  pythonImportsCheck = [ "recurring_ical_events" ];

  meta = {
    description = "Repeat ICalendar events by RRULE, RDATE and EXDATE";
    homepage = "https://github.com/niccokunzmann/python-recurring-ical-events";
    license = lib.licenses.lgpl3Plus;
    maintainers = [ ];
  };
}
