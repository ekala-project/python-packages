{
  lib,
  buildPythonPackage,
  cryptography,
  fetchPypi,
  hawkauthlib,
  pybrowserid,
  pyjwt,
  requests,
  hatchling,
}:

buildPythonPackage (finalAttrs: {
  pname = "pyfxa";
  version = "0.9.0";
  pyproject = true;

  src = fetchPypi {
    inherit (finalAttrs) pname version;
    hash = "sha256-a2BfT4Yq6OR0znESJoXB9eoELr5PHryW/+D4L3bFlV0=";
  };

  build-system = [ hatchling ];

  dependencies = [
    cryptography
    hawkauthlib
    pybrowserid
    pyjwt
    requests
  ];

  pythonImportsCheck = [ "fxa" ];

  meta = {
    description = "Firefox Accounts client library";
    mainProgram = "fxa-client";
    homepage = "https://github.com/mozilla/PyFxA";
    license = lib.licenses.mpl20;
  };
})
