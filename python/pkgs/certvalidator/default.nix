{ lib
, buildPythonPackage
, fetchFromGitHub
, setuptools
, asn1crypto
, oscrypto
,
}:

buildPythonPackage (finalAttrs: {
  pname = "certvalidator";
  version = "0.11.1";
  pyproject = true;

  __structuredAttrs = true;

  src = fetchFromGitHub {
    owner = "wbond";
    repo = "certvalidator";
    tag = finalAttrs.version;
    hash = "sha256-yVF7t4FuU3C9fDg67JeM7LWZZh/mv5F4EKmjlO4AuBY=";
  };

  build-system = [ setuptools ];

  dependencies = [
    asn1crypto
    oscrypto
  ];

  meta = {
    homepage = "https://github.com/wbond/certvalidator";
    description = "Validates X.509 certificates and paths";
    license = lib.licenses.mit;
    maintainers = [ ];
  };
})
