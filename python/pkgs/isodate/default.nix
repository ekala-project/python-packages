{
  lib,
  buildPythonPackage,
  fetchPypi,
  setuptools,
  setuptools-scm,
}:

buildPythonPackage rec {
  pname = "isodate";
  version = "0.7.2";
  pyproject = true;

  src = fetchPypi {
    inherit pname version;
    hash = "sha256-TNGqD0PKdvSmxsApKoX0CzXsLkPjFbWfBubTIXGpU+Y=";
  };

  build-system = [
    setuptools
    setuptools-scm
  ];

  meta = {
    description = "ISO 8601 date/time parser";
    homepage = "https://github.com/gweis/isodate/";
    license = lib.licenses.bsd0;
  };
}
