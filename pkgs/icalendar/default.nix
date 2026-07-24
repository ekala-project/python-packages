{
  lib,
  fetchPypi,
  buildPythonPackage,
  hatch-vcs,
  hatchling,
  python-dateutil,
  tzdata,
}:

buildPythonPackage rec {
  pname = "icalendar";
  version = "7.2.2";
  pyproject = true;

  src = fetchPypi {
    inherit pname version;
    hash = "sha256-bPkEqSiIHiDIm2gudbyi65foxcpil4LtRKUZq/TKwcw=";
  };

  build-system = [
    hatch-vcs
    hatchling
  ];

  dependencies = [
    python-dateutil
    tzdata
  ];

  pythonImportsCheck = [ "icalendar" ];

  meta = {
    homepage = "https://github.com/collective/icalendar";
    description = "Parser/generator of iCalendar files";
    license = lib.licenses.bsd2;
  };
}
