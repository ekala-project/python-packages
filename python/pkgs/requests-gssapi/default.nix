{
  lib,
  buildPythonPackage,
  fetchPypi,
  gssapi,
  requests,
  setuptools,
}:

buildPythonPackage rec {
  pname = "requests-gssapi";
  version = "1.4.0";
  pyproject = true;

  src = fetchPypi {
    inherit version;
    pname = "requests_gssapi";
    hash = "sha256-uifrMp9IQNllvI+l02DGJ8dDSe+mFWylAa2Jr8ahNPQ=";
  };

  build-system = [ setuptools ];

  dependencies = [
    gssapi
    requests
  ];

  pythonImportsCheck = [ "requests_gssapi" ];

  meta = {
    description = "GSSAPI authentication handler for python-requests";
    homepage = "https://github.com/pythongssapi/requests-gssapi";
    license = lib.licenses.isc;
    maintainers = [ ];
  };
}
