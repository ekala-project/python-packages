{
  lib,
  stdenv,
  buildPythonPackage,
  c-ares,
  cython,
  fetchPypi,
  openssl,
  pkg-config,
  protobuf,
  typing-extensions,
  setuptools,
  zlib,
}:

buildPythonPackage (finalAttrs: {
  pname = "grpcio";
  version = "1.85.1";
  pyproject = true;

  src = fetchPypi {
    inherit (finalAttrs) pname version;
    hash = "sha256-X1MCh9XeX39mCJ6tgd5E9nhxYpRNqzki76Zd/f8Qih0=";
  };

  outputs = [
    "out"
    "dev"
  ];

  build-system = [ setuptools ];

  nativeBuildInputs = [
    cython
    pkg-config
  ];

  buildInputs = [
    c-ares
    openssl
    zlib
  ];

  dependencies = [
    protobuf
    typing-extensions
  ];

  preBuild = ''
    export GRPC_PYTHON_BUILD_EXT_COMPILER_JOBS="$NIX_BUILD_CORES"
    if [ -z "$enableParallelBuilding" ]; then
      GRPC_PYTHON_BUILD_EXT_COMPILER_JOBS=1
    fi
  ''
  + lib.optionalString stdenv.hostPlatform.isDarwin ''
    unset AR
  '';

  env = {
    GRPC_BUILD_WITH_BORING_SSL_ASM = "";
    GRPC_PYTHON_BUILD_SYSTEM_OPENSSL = 1;
    GRPC_PYTHON_BUILD_SYSTEM_ZLIB = 1;
    GRPC_PYTHON_BUILD_SYSTEM_CARES = 1;
  };

  enableParallelBuilding = true;

  pythonImportsCheck = [ "grpc" ];

  meta = {
    description = "HTTP/2-based RPC framework";
    homepage = "https://grpc.io/grpc/python/";
    license = lib.licenses.asl20;
  };
})
