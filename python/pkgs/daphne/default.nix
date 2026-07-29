{
  lib,
  asgiref,
  autobahn,
  buildPythonPackage,
  fetchFromGitHub,
  setuptools,
  twisted,
}:

buildPythonPackage (finalAttrs: {
  pname = "daphne";
  version = "4.2.2";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "django";
    repo = "daphne";
    tag = finalAttrs.version;
    hash = "sha256-i0BwZCpMZW6WXK94FSvlEheXHUzXviCBEew6AbkLkpk=";
  };

  build-system = [ setuptools ];

  dependencies = [
    asgiref
    autobahn
    twisted
  ]
  ++ twisted.optional-dependencies.tls;

  pythonImportsCheck = [ "daphne" ];

  meta = {
    description = "Django ASGI (HTTP/WebSocket) server";
    homepage = "https://github.com/django/daphne";
    license = lib.licenses.bsd3;
    maintainers = [ ];
    mainProgram = "daphne";
  };
})
