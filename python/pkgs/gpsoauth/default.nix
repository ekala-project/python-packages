{
  lib,
  fetchPypi,
  buildPythonPackage,
  poetry-core,
  pycryptodomex,
  requests,
}:

buildPythonPackage (finalAttrs: {
  pname = "gpsoauth";
  version = "3.0.0";
  pyproject = true;

  src = fetchPypi {
    inherit (finalAttrs) pname version;
    hash = "sha256-6gbP6uMqc5HIeKsdJ1wCTAfDwyvFmbKf0o+AyCsxODU=";
  };

  build-system = [ poetry-core ];

  dependencies = [
    pycryptodomex
    requests
  ];

  pythonImportsCheck = [ "gpsoauth" ];

  meta = {
    description = "Library for Google Play Services OAuth";
    homepage = "https://github.com/simon-weber/gpsoauth";
    license = lib.licenses.mit;
  };
})
