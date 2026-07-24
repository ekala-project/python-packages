{
  lib,
  buildPythonPackage,
  fetchFromGitHub,

  # build-system
  hatchling,

  # optional-dependencies
  # PySPX
  pyspx,
  # awskms
  boto3,
  botocore,
  cryptography,
  # azurekms
  azure-identity,
  azure-keyvault-keys,
  # hsm
  asn1crypto,
  # gcpkms
  google-cloud-kms,
  # pynacl
  pynacl,

  # tests
  ed25519,
}:

buildPythonPackage (finalAttrs: {
  pname = "securesystemslib";
  version = "1.4.0";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "secure-systems-lab";
    repo = "securesystemslib";
    tag = "v${finalAttrs.version}";
    hash = "sha256-XOE690DKeAMP2KycW+fdYs/KGWqwZCZz/9PiAa6tJbw=";
  };

  postPatch = ''
    substituteInPlace pyproject.toml \
      --replace-fail '"hatchling==1.29.0"' '"hatchling"'
  '';

  build-system = [ hatchling ];

  optional-dependencies = {
    PySPX = [ pyspx ];
    awskms = [
      boto3
      botocore
      cryptography
    ];
    azurekms = [
      azure-identity
      azure-keyvault-keys
      cryptography
    ];
    crypto = [ cryptography ];
    gcpkms = [
      cryptography
      google-cloud-kms
    ];
    hsm = [
      asn1crypto
      cryptography
      #   pykcs11
    ];
    pynacl = [ pynacl ];
    # Circular dependency
    # sigstore = [
    #   sigstore
    # ];
  };
  meta = {
    description = "Cryptographic and general-purpose routines";
    homepage = "https://github.com/secure-systems-lab/securesystemslib";
    license = lib.licenses.mit;
    maintainers = [ ];
  };
})
