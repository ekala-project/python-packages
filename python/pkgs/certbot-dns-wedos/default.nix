{
  lib,
  buildPythonPackage,
  fetchPypi,
  acme,
  certbot,
  setuptools,
  requests,
  pytz,
  tldextract,
}:

buildPythonPackage (finalAttrs: {
  pname = "certbot-dns-wedos";
  version = "2.5";
  pyproject = true;

  src = fetchPypi {
    inherit (finalAttrs) version;
    pname = "certbot_dns_wedos";
    hash = "sha256-3+vel/7ACjD2Ce40PbYOxQWK6K0GuKOh+aCFxmVOAQk=";
  };

  build-system = [ setuptools ];

  dependencies = [
    certbot
    acme
    requests
    pytz
    tldextract
  ];

  pythonImportsCheck = [ "certbot_dns_wedos" ];

  meta = {
    description = "Wedos DNS Authenticator plugin for Certbot";
    homepage = "https://github.com/clazzor/certbot-dns-wedos";
    license = lib.licenses.asl20;
  };
})
