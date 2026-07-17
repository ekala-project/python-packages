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
  version = "7.2.0";
  pyproject = true;

  src = fetchPypi {
    inherit pname version;
    hash = "sha256-MtrMOWEBgluC+fG732kcAr5hMTDVq3pFflU/zSCVn90=";
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
