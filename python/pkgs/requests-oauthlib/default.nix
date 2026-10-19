{
  lib,
  buildPythonPackage,
  fetchPypi,
  # build-system
  setuptools,
  oauthlib,
  requests,
}:

buildPythonPackage (finalAttrs: {
  pname = "requests-oauthlib";
  version = "2.0.0";
  pyproject = true;

  src = fetchPypi {
    inherit (finalAttrs) pname version;
    hash = "sha256-s9/669iE2M13hJQ2lgOp57WNKREb9rQb3C3NhyA69Ok=";
  };

  build-system = [ setuptools ];

  dependencies = [
    oauthlib
    requests
  ];

  pythonImportsCheck = [ "requests_oauthlib" ];

  meta = {
    description = "OAuthlib authentication support for Requests";
    homepage = "https://github.com/requests/requests-oauthlib";
    license = with lib.licenses; [ isc ];
  };
})
