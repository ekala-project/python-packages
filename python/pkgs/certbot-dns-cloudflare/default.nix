{
  buildPythonPackage,
  acme,
  certbot,
  cloudflare,
  setuptools,
}:

buildPythonPackage rec {
  pname = "certbot-dns-cloudflare";
  pyproject = true;

  inherit (certbot) src version;

  sourceRoot = "${src.name}/certbot-dns-cloudflare";

  build-system = [ setuptools ];

  dependencies = [
    acme
    certbot
    cloudflare
  ];

  pythonImportsCheck = [ "certbot_dns_cloudflare" ];

  meta = certbot.meta // {
    description = "Cloudflare DNS Authenticator plugin for Certbot";
    maintainers = [ ];
  };
}
