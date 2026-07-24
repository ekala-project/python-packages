{
  lib,
  buildPythonPackage,
  fetchPypi,
  setuptools,
}:

buildPythonPackage rec {
  pname = "ntplib";
  version = "0.4.0";
  pyproject = true;

  src = fetchPypi {
    inherit pname version;
    hash = "sha256-iZ2PtfjCVVITrqle/KApNMc0Pfas6ddiilF2sXaQYmc=";
  };

  build-system = [ setuptools ];

  # Requires networking
  doCheck = false;

  pythonImportsCheck = [ "ntplib" ];

  meta = {
    description = "Python NTP library";
    homepage = "http://code.google.com/p/ntplib/";
    license = lib.licenses.mit;
  };
}
