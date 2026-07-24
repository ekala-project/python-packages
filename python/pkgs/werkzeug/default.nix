{
  lib,
  buildPythonPackage,
  fetchPypi,

  # build-system
  flit-core,

  # dependencies
  markupsafe,

  # optional-dependencies
  watchdog,
}:

buildPythonPackage rec {
  pname = "werkzeug";
  version = "3.1.8";
  pyproject = true;

  src = fetchPypi {
    inherit pname version;
    hash = "sha256-m61hpCaNrBEvHFzUYwpW7eYBtu1CAwBneoaQg9cKTEQ=";
  };

  build-system = [ flit-core ];

  dependencies = [ markupsafe ];

  optional-dependencies = {
    watchdog = [ watchdog ];
  };

  pythonImportsCheck = [ "werkzeug" ];

  meta = {
    homepage = "https://palletsprojects.com/p/werkzeug/";
    description = "Comprehensive WSGI web application library";
    longDescription = ''
      Werkzeug is a comprehensive WSGI web application library. It
      began as a simple collection of various utilities for WSGI
      applications and has become one of the most advanced WSGI
      utility libraries.
    '';
    license = lib.licenses.bsd3;
  };
}
