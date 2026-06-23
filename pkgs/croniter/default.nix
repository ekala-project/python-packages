{
  lib,
  buildPythonPackage,
  fetchPypi,
  setuptools,
  python-dateutil,
  pytz,
}:

buildPythonPackage rec {
  pname = "croniter";
  version = "6.0.0";
  pyproject = true;

  src = fetchPypi {
    inherit pname version;
    hash = "sha256-N8UEsxOVYRSpg+ziwrB3kLHxCU/p2BzJRzkhR0glVXc=";
  };

  nativeBuildInputs = [ setuptools ];

  propagatedBuildInputs = [
    python-dateutil
    pytz
  ];

  pythonImportsCheck = [ "croniter" ];

  meta = {
    description = "Library to iterate over datetime object with cron like format";
    homepage = "https://github.com/kiorky/croniter";
    license = lib.licenses.mit;
  };
}
