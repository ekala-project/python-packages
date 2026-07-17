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

buildPythonPackage rec {
  pname = "pysaml2";
  version = "7.5.4";
  pyproject = true;

  src = fetchPypi {
    inherit pname version;
    hash = "sha256-uCfcqrc8T3/gAclFQB60Qs/aXSIAHOpQwgwTjpre/+o=";
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
}
