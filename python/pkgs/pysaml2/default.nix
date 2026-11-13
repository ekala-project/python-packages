{
  lib,
  fetchPypi,
  buildPythonPackage,
  poetry-core,
  cryptography,
  defusedxml,
  pyopenssl,
  python-dateutil,
  requests,
  xmlschema,
}:

buildPythonPackage (finalAttrs: {
  pname = "pysaml2";
  version = "7.5.5";
  pyproject = true;

  src = fetchPypi {
    inherit (finalAttrs) pname version;
    hash = "sha256-vRw/NmeAfeYdcNjlzzJhhxnZ3BuRptFqKR73oeqlL/8=";
  };

  pythonRelaxDeps = [
    "pyopenssl"
    "xmlschema"
  ];

  build-system = [ poetry-core ];

  dependencies = [
    cryptography
    defusedxml
    pyopenssl
    python-dateutil
    requests
    xmlschema
  ];

  pythonImportsCheck = [ "saml2" ];

  meta = {
    description = "Python implementation of SAML Version 2 Standard";
    homepage = "https://github.com/IdentityPython/pysaml2";
    license = lib.licenses.asl20;
  };
})
