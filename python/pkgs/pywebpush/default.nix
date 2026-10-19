{
  lib,
  aiohttp,
  buildPythonPackage,
  cryptography,
  fetchPypi,
  http-ece,
  py-vapid,
  requests,
  setuptools,
  six,
}:

buildPythonPackage (finalAttrs: {
  pname = "pywebpush";
  version = "2.5.0";
  pyproject = true;

  src = fetchPypi {
    inherit (finalAttrs) pname version;
    hash = "sha256-gmD45C1w7ZWjvQBSf/y0O1s9+Jg6SkiwWf4psG3D2Sw=";
  };

  build-system = [ setuptools ];

  dependencies = [
    aiohttp
    cryptography
    http-ece
    py-vapid
    requests
    six
  ];
  pythonImportsCheck = [ "pywebpush" ];

  meta = {
    description = "Webpush Data encryption library for Python";
    homepage = "https://github.com/web-push-libs/pywebpush";
    license = lib.licenses.mpl20;
    mainProgram = "pywebpush";
  };
})
