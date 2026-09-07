{
  lib,
  buildPythonPackage,
  fetchPypi,
  betamax,
  iso8601,
  lxml,
  oauthlib,
  os-service-types,
  pyyaml,
  requests,
  requests-kerberos,
  setuptools,
  stevedore,
  typing-extensions,
}:

buildPythonPackage rec {
  pname = "keystoneauth1";
  version = "5.17.0";
  pyproject = true;

  src = fetchPypi {
    inherit pname version;
    hash = "sha256-gjWazCDHVPyyKBjgkOL+pkfkxcETemrdtJhOn7pwirM=";
  };

  build-system = [ setuptools ];

  pythonRelaxDeps = [ "stevedore" ];

  dependencies = [
    iso8601
    os-service-types
    requests
    stevedore
    typing-extensions
  ];
  # TODO: remove this workaround and fix breakages
  optional-dependencies = {
    betamax = [
      betamax
      pyyaml
    ];
    kerberos = [ requests-kerberos ];
    oauth1 = [ oauthlib ];
    saml2 = [ lxml ];
  };

  pythonImportsCheck = [ "keystoneauth1" ];

  meta = {
    description = "Authentication Library for OpenStack Identity";
    homepage = "https://github.com/openstack/keystoneauth";
    license = lib.licenses.asl20;
    maintainers = [ ];
  };
}
