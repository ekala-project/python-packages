{
  lib,
  stdenv,
  buildPythonPackage,
  fetchFromGitHub,

  # build-system
  poetry-core,

  # dependencies
  prometheus-client,
  starlette,

  # tests
  devtools,
  httpx2,
  pytest-asyncio,
  requests,
}:

buildPythonPackage (finalAttrs: {
  pname = "prometheus-fastapi-instrumentator";
  version = "8.1.0";
  pyproject = true;
  __structuredAttrs = true;

  src = fetchFromGitHub {
    owner = "trallnag";
    repo = "prometheus-fastapi-instrumentator";
    tag = "v${finalAttrs.version}";
    hash = "sha256-oSP0KH5niST0MICTxVyAdZmH08RTx3cgXQrOT83qBsM=";
  };

  build-system = [
    poetry-core
  ];

  dependencies = [
    prometheus-client
    starlette
  ];
  # numerous test failures on Darwin
  doCheck = !stdenv.hostPlatform.isDarwin;

  pythonImportsCheck = [ "prometheus_fastapi_instrumentator" ];

  meta = {
    description = "Instrument FastAPI with Prometheus metrics";
    homepage = "https://github.com/trallnag/prometheus-fastapi-instrumentator";
    license = with lib.licenses; [
      isc
      bsd3
    ];
    platforms = lib.platforms.unix;
  };
})
