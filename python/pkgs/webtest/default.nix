{
  lib,
  buildPythonPackage,
  fetchPypi,

  # build-system
  setuptools,

  # dependencies
  beautifulsoup4,
  waitress,
  webob,
}:

buildPythonPackage rec {
  pname = "webtest";
  version = "3.0.7";
  pyproject = true;

  src = fetchPypi {
    inherit pname version;
    hash = "sha256-euq1D5cNRsBo56Nt0WLLJCWR7fcqHQTv0hN0dyuTF0E=";
  };

  build-system = [ setuptools ];

  dependencies = [
    beautifulsoup4
    waitress
    webob
  ];

  pythonImportsCheck = [ "webtest" ];

  meta = {
    description = "Helper to test WSGI applications";
    homepage = "https://webtest.readthedocs.org/";
    license = lib.licenses.mit;
  };
}
