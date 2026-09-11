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

  # bdist_wheel spawns a subprocess that does "from distutils.util import byte_compile"
  # which fails on Python 3.13+ (distutils removed from stdlib). Disable byte-compilation.
  postPatch = ''
    cat >> setup.cfg <<CFG
    [install]
    compile = 0
    optimize = 0
    CFG
  '';

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
