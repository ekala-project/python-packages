{
  lib,
  buildPythonPackage,
  fetchPypi,
  setuptools,
  plaster,
  pastedeploy,
}:

buildPythonPackage rec {
  pname = "plaster_pastedeploy";
  version = "1.0.1";
  pyproject = true;

  src = fetchPypi {
    inherit pname version;
    hash = "sha256-viYubS5BpyZIddqi/ihQy7BhVyi83JKCj9xyc244FBI=";
  };

  build-system = [ setuptools ];

  dependencies = [
    plaster
    pastedeploy
  ];

  pythonImportsCheck = [ "plaster_pastedeploy" ];

  meta = {
    description = "PasteDeploy binding to the plaster configuration loader";
    homepage = "https://github.com/Pylons/plaster_pastedeploy";
    license = lib.licenses.mit;
  };
}
