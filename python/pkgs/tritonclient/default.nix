{
  lib,
  buildPythonPackage,
  fetchPypi,
  numpy,
  python-rapidjson,
  urllib3,
  # optional dependencies
  aiohttp,
  geventhttpclient,
  grpcio,
  packaging,
}:

let
  pname = "tritonclient";
  version = "2.74.0";
  format = "wheel";
in
buildPythonPackage (finalAttrs: {
  inherit pname version format;

  src = fetchPypi {
    inherit pname version format;
    python = "py3";
    dist = "py3";
    platform = "any";
    hash = "sha256-AlLeMFgb+USsNvEjGO0sqdct/59mIq/Jo33P1G92+O4=";
  };

  dependencies = [
    numpy
    python-rapidjson
    urllib3
  ];

  pythonImportsCheck = [ "tritonclient" ];

  passthru = {
    optional-dependencies = {
      http = [
        aiohttp
        geventhttpclient
      ];
      grpc = [
        grpcio
        packaging
      ];
    };
  };

  meta = {
    description = "Triton Python client";
    homepage = "https://github.com/triton-inference-server/client";
    license = lib.licenses.bsd3;
    platforms = lib.platforms.linux;
  };
})
