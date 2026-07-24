{
  lib,
  buildPythonPackage,
  fetchFromGitHub,
  setuptools,
  itsdangerous,
  python-multipart,
}:

buildPythonPackage rec {
  pname = "asgi-csrf";
  version = "0.11";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "simonw";
    repo = "asgi-csrf";
    tag = version;
    hash = "sha256-STitMWabAPz61AU+5gFJSHBBqf67Q8UtS6ks8Q/ZybY=";
  };

  build-system = [ setuptools ];

  dependencies = [
    itsdangerous
    python-multipart
  ];

  pythonImportsCheck = [ "asgi_csrf" ];

  meta = {
    description = "ASGI middleware for protecting against CSRF attacks";
    homepage = "https://github.com/simonw/asgi-csrf";
    license = lib.licenses.asl20;
  };
}
