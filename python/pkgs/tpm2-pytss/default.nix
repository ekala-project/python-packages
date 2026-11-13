{
  lib,
  stdenv,
  buildPythonPackage,
  fetchPypi,
  # build-system
  setuptools,
  cffi,
  cryptography,
  packaging,
  pkgconfig,
  # see nativeBuildInputs
  pkg-config,
  # see nativeBuildInputs
  pyyaml,
  setuptools-scm,
  tpm2-tss,
  swtpm,
}:

let
  isCross = (stdenv.buildPlatform != stdenv.hostPlatform);
in
buildPythonPackage (finalAttrs: {
  pname = "tpm2-pytss";
  version = "3.0.0";
  pyproject = true;

  src = fetchPypi {
    pname = "tpm2_pytss";
    inherit (finalAttrs) version;
    hash = "sha256-wZPPGQi0gvk8SqRkEykg/jo31LnYAuJnl0/y3+N9RDM=";
  };

  build-system = [ setuptools ];

  # Hardening has to be disabled
  # due to pycparsing handling it poorly.
  # See https://github.com/NixOS/nixpkgs/issues/252023
  # for more details.
  hardeningDisable = [ "fortify" ];

  nativeBuildInputs = [
    cffi
    pkg-config
    pkgconfig
    setuptools-scm
  ];

  buildInputs = [ tpm2-tss ];

  dependencies = [
    cffi
    cryptography
    packaging
    pyyaml
  ];

  pythonImportsCheck = [ "tpm2_pytss" ];

  meta = {
    homepage = "https://github.com/tpm2-software/tpm2-pytss";
    description = "TPM2 TSS Python bindings for Enhanced System API (ESYS)";
    license = lib.licenses.bsd2;
  };
})
