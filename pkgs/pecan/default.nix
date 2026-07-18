{
  lib,
  fetchPypi,
  buildPythonPackage,
  setuptools,
  mako,
  webob,
}:

buildPythonPackage rec {
  pname = "pecan";
  version = "1.8.0";
  pyproject = true;

  src = fetchPypi {
    inherit pname version;
    hash = "sha256-L5+86obo2/Gi0olUIlVHY0oonbcgHndkUWpdzobBFt4=";
  };

  build-system = [ setuptools ];

  dependencies = [
    mako
    setuptools
    webob
  ];

  pythonImportsCheck = [ "pecan" ];

  meta = {
    description = "WSGI object-dispatching web framework";
    homepage = "https://www.pecanpy.org/";
    license = lib.licenses.bsd3;
  };
}
