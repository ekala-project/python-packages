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
  version = "8.0.2";
  pyproject = true;
  __structuredAttrs = true;

  src = fetchFromGitHub {
    owner = "trallnag";
    repo = "prometheus-fastapi-instrumentator";
    tag = "v${finalAttrs.version}";
    hash = "sha256-fTJjAM1jUZXfhjLo9xqlu45LaoqZ330ogOA6x7aByqw=";
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
    maintainers = [ ];
    platforms = lib.platforms.unix;
  };
})
