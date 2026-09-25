{
  lib,
  buildPythonPackage,
  dnspython,
  fetchFromGitHub,
  icalendar,
  icalendar-searcher,
  lxml,
  python,
  recurring-ical-events,
  niquests,
  hatchling,
  hatch-vcs,
  python-dateutil,
  pyyaml,
}:

buildPythonPackage rec {
  pname = "caldav";
  version = "3.3.0";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "python-caldav";
    repo = "caldav";
    tag = "v${version}";
    hash = "sha256-FV1C8RlbkNXOTtRKSCNgiGetImW0+647JgmZtf5U+pY=";
  };

  build-system = [
    hatchling
    hatch-vcs
  ];

  dependencies = [
    dnspython
    lxml
    niquests
    icalendar
    icalendar-searcher
    recurring-ical-events
    python-dateutil
    pyyaml
  ];

  pythonImportsCheck = [ "caldav" ];

  meta = {
    description = "CalDAV (RFC4791) client library";
    homepage = "https://github.com/python-caldav/caldav";
    license = lib.licenses.asl20;
  };
}
