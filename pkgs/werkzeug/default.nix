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
  version = "3.1.6";
  pyproject = true;

  src = fetchPypi {
    inherit pname version;
    hash = "sha256-IQxr7eWkIKkTlWtHkaf01oQ6Q7b87k36CKZekwB9DSU=";
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
