{
  lib,
  buildPythonPackage,
  cryptography,
  uv-build,
}:

buildPythonPackage (finalAttrs: {
  pname = "cryptography-vectors";
  # The test vectors must have the same version as the cryptography package
  inherit (cryptography) version src;
  pyproject = true;

  sourceRoot = "${finalAttrs.src.name}/vectors";

  build-system = [ uv-build ];

  # No tests included

  pythonImportsCheck = [ "cryptography_vectors" ];

  meta = {
    description = "Test vectors for the cryptography package";
    homepage = "https://cryptography.io/en/latest/development/test-vectors/";
    downloadPage = "https://github.com/pyca/cryptography/tree/master/vectors";
    license = with lib.licenses; [
      asl20
      bsd3
    ];
  };
})
