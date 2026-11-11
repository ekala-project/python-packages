{
  lib,
  buildPythonPackage,
  fetchPypi,
  hatchling,
  hatch-vcs,
  hatch-fancy-pypi-readme,
  tzdata,
}:

buildPythonPackage (finalAttrs: {
  pname = "python-dateutil";
  version = "4.0.0";
  pyproject = true;

  src = fetchPypi {
    pname = "python_dateutil";
    inherit (finalAttrs) version;
    hash = "sha256-1ylf8U/cD5L2YhAL+2xVHRYMoJDyk58exbl5QmXAPwY=";
  };

  build-system = [
    hatchling
    hatch-vcs
    hatch-fancy-pypi-readme
  ];

  dependencies = [ tzdata ];

  # cyclic dependency: tests need freezegun, which depends on python-dateutil

  pythonImportsCheck = [
    "dateutil.easter"
    "dateutil.parser"
    "dateutil.relativedelta"
    "dateutil.rrule"
    "dateutil.tz"
    "dateutil.utils"
    "dateutil.zoneinfo"
  ];

  meta = {
    description = "Powerful extensions to the standard datetime module";
    homepage = "https://github.com/dateutil/dateutil/";
    license = lib.licenses.bsd3;
  };
})
