{ lib
, buildPythonPackage
, cached-property
, defusedxml
, dnspython
, fetchFromGitHub
, isodate
, lxml
, oauthlib
, pygments
, requests
, requests-ntlm
, requests-gssapi
, requests-oauthlib
, setuptools
, tzdata
, tzlocal
,
}:

buildPythonPackage rec {
  pname = "exchangelib";
  version = "5.6.0";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "ecederstrand";
    repo = "exchangelib";
    tag = "v${version}";
    hash = "sha256-tmJq0AZLuOic63ziIr173lbz6sDF/u75Y2ASYnHHDTM=";
  };

  pythonRelaxDeps = [ "defusedxml" ];

  build-system = [ setuptools ];

  dependencies = [
    cached-property
    defusedxml
    dnspython
    isodate
    lxml
    oauthlib
    pygments
    requests
    requests-ntlm
    requests-oauthlib
    tzdata
    tzlocal
  ];

  optional-dependencies = {
    complete = [
      requests-gssapi
      # requests-negotiate-sspi
    ];
    kerberos = [ requests-gssapi ];
    # sspi = [
    #   requests-negotiate-sspi
    # ];
  };

  pythonImportsCheck = [ "exchangelib" ];

  meta = {
    description = "Client for Microsoft Exchange Web Services (EWS)";
    homepage = "https://github.com/ecederstrand/exchangelib";
    license = lib.licenses.bsd2;
  };
}
