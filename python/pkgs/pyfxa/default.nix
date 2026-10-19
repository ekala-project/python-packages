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
  version = "0.8.2";
  pyproject = true;

  src = fetchPypi {
    inherit (finalAttrs) pname version;
    hash = "sha256-gq/OfpKjw6BSbGKTXbRa2crxleJJoj0BN4Ful1npWlw=";
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
