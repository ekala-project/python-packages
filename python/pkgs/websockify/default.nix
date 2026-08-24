{
  lib,
  buildPythonPackage,
  fetchFromGitHub,
  setuptools,
  jwcrypto,
  numpy,
  redis,
  requests,
  simplejson,
}:

buildPythonPackage (finalAttrs: {
  pname = "websockify";
  version = "0.13.0";
  pyproject = true;

  __structuredAttrs = true;

  src = fetchFromGitHub {
    owner = "novnc";
    repo = "websockify";
    tag = "v${finalAttrs.version}";
    hash = "sha256-b57L4o071zEt/gX9ZVzEpcnp0RCeo3peZrby2mccJgQ=";
  };

  build-system = [ setuptools ];

  dependencies = [
    jwcrypto
    numpy
    redis
    requests
    simplejson
  ];

  pythonImportsCheck = [ "websockify" ];

  meta = {
    description = "WebSockets support for any application/server";
    mainProgram = "websockify";
    homepage = "https://github.com/novnc/websockify";
    license = lib.licenses.lgpl3Only;
    maintainers = [ ];
  };
})
