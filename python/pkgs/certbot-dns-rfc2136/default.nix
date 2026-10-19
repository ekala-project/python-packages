{
  buildPythonPackage,
  acme,
  certbot,
  dnspython,
  pytestCheckHook,
  # build-system
  setuptools,
}:

buildPythonPackage (finalAttrs: {
  pname = "certbot-dns-rfc2136";
  pyproject = true;

  inherit (certbot) src version;

  sourceRoot = "${src.name}/certbot-dns-rfc2136";

  build-system = [ setuptools ];

  dependencies = [
    acme
    certbot
    dnspython
  ];

  nativeCheckInputs = [ pytestCheckHook ];

  pytestFlags = [
    "-pno:cacheprovider"

    # Monitor https://github.com/certbot/certbot/issues/9606 for a solution
    "-Wignore::DeprecationWarning"
  ];

  meta = certbot.meta // {
    description = "RFC 2136 DNS Authenticator plugin for Certbot";
  };
})
