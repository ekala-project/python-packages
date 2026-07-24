{
  lib,
  buildPythonPackage,
  fetchFromGitHub,

  # build-system
  distutils,
  setuptools,

  # native dependencies
  openldap,
  cyrus_sasl,

  pyasn1,
  pyasn1-modules,

  # tests
  jaraco-functools,
}:

buildPythonPackage (finalAttrs: {
  pname = "python-ldap";
  version = "3.4.7";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "python-ldap";
    repo = "python-ldap";
    tag = "python-ldap-${finalAttrs.version}";
    hash = "sha256-uSP8c5gid5TBenBaNVdlteHatkctAafz6yFHuIYKiTY=";
  };

  build-system = [
    distutils
    setuptools
  ];

  buildInputs = [
    openldap
    cyrus_sasl
  ];

  dependencies = [
    pyasn1
    pyasn1-modules
  ];
  meta = {
    description = "Python modules for implementing LDAP clients";
    downloadPage = "https://github.com/python-ldap/python-ldap";
    homepage = "https://www.python-ldap.org/";
    license = lib.licenses.psfl;
    maintainers = [ ];
  };
})
