{ lib
, buildPythonPackage
, fetchFromGitHub
, setuptools
, zope-component
, zope-i18nmessageid
, zope-interface
, zope-location
, zope-proxy
, zope-schema
, pytz
, zope-configuration
,
}:

buildPythonPackage rec {
  pname = "zope-security";
  version = "8.3";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "zopefoundation";
    repo = "zope.security";
    tag = version;
    hash = "sha256-iSWSBjtJe4iEvm+VUEWDvRCBdRz1R6m9mlfPLwh01Sk=";
  };

  build-system = [
    setuptools
    zope-proxy
  ];

  dependencies = [
    zope-component
    zope-i18nmessageid
    zope-interface
    zope-location
    zope-proxy
    zope-schema
  ];

  optional-dependencies = {
    pytz = [ pytz ];
    # untrustedpython = [ zope-untrustedpython ];
    zcml = [ zope-configuration ];
  };

  pythonImportsCheck = [ "zope.security" ];

  # Import process is too complex and some tests fail
  unittestFlagsArray = [ "src/zope/security/tests" ];

  pythonNamespaces = [ "zope" ];

  meta = {
    description = "Zope Security Framework";
    homepage = "https://github.com/zopefoundation/zope.security";
    license = lib.licenses.zpl21;
    maintainers = [ ];
  };
}
