{
  lib,
  fetchPypi,
  buildPythonPackage,
  setuptools,
  pyasn1,
}:

buildPythonPackage rec {
  pname = "ldap3";
  version = "2.9.1";
  pyproject = true;

  src = fetchPypi {
    inherit pname version;
    hash = "sha256-8+f8Rxjj8J3aVotXEACV4M5YYzvKu+2GZ84/j7qkIp8=";
  };

  build-system = [ setuptools ];

  dependencies = [ pyasn1 ];

  doCheck = false;

  pythonImportsCheck = [ "ldap3" ];

  meta = {
    description = "Strictly RFC 4510 conforming LDAP V3 pure Python client library";
    homepage = "https://github.com/cannatag/ldap3";
    license = lib.licenses.lgpl3Plus;
  };
}
