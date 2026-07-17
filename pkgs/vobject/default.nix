{
  lib,
  fetchPypi,
  buildPythonPackage,
  setuptools,
  python-dateutil,
  pytz,
  six,
}:

buildPythonPackage rec {
  pname = "vobject";
  version = "0.9.9";
  pyproject = true;

  src = fetchPypi {
    inherit pname version;
    hash = "sha256-rETl1+IHnYTB1SxQphW5vsSxupWGCMTH/kDL8zJHs44=";
  };

  build-system = [ setuptools ];

  dependencies = [
    python-dateutil
    pytz
    six
  ];

  doCheck = false;

  pythonImportsCheck = [ "vobject" ];

  meta = {
    description = "Module for reading vCard and vCalendar files";
    homepage = "https://github.com/py-vobject/vobject";
    license = lib.licenses.asl20;
  };
}
