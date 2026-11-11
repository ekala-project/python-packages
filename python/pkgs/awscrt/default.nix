{
  lib,
  buildPythonPackage,
  fetchPypi,
  setuptools,
  cmake,
  perl,
  stdenv,
}:

buildPythonPackage (finalAttrs: {
  pname = "awscrt";
  version = "0.38.1";
  pyproject = true;

  src = fetchPypi {
    inherit (finalAttrs) pname version;
    hash = "sha256-Dc6/qnDPB5EzzSNSEZ49Bem4yh0WIXNs+1TAPz1f7w8=";
  };

  requiredSystemFeatures = [ "big-parallel" ];

  build-system = [ setuptools ];

  nativeBuildInputs = [ cmake ] ++ lib.optionals (!stdenv.hostPlatform.isDarwin) [ perl ];

  hardeningDisable = [ "fortify" ]; # needed for jitterentropy

  dontUseCmakeConfigure = true;

  pythonImportsCheck = [ "awscrt" ];

  # Unable to import test module
  # https://github.com/awslabs/aws-crt-python/issues/281

  meta = {
    homepage = "https://github.com/awslabs/aws-crt-python";
    description = "Python bindings for the AWS Common Runtime";
    license = lib.licenses.asl20;
  };
})
