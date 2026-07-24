{
  lib,
  buildPythonPackage,
  fetchFromGitHub,
  rustPlatform,

  pytest-asyncio,
  redis,
}:

buildPythonPackage (finalAttrs: {
  pname = "burner-redis";
  version = "0.1.7";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "prefectlabs";
    repo = "burner-redis";
    tag = "v${finalAttrs.version}";
    hash = "sha256-Ybi8F0imJKUQiF0Gfy/WGcAqfQSPoT1tAvOXDnI5Z7M=";
  };

  cargoDeps = rustPlatform.fetchCargoVendor {
    inherit (finalAttrs) pname version src;
    hash = "sha256-laD/FhYxXCOZOvs0e7ad80vUgX4eoHpLQu6dx/glkEM=";
  };

  nativeBuildInputs = [
    rustPlatform.cargoSetupHook
    rustPlatform.maturinBuildHook
  ];

  pythonImportsCheck = [ "burner_redis" ];
  meta = {
    description = "Embedded, in-process Redis-compatible database";
    homepage = "https://github.com/prefectlabs/burner-redis";
    downloadPage = "https://github.com/prefectlabs/burner-redis/releases";
    license = lib.licenses.mit;
    maintainers = [ ];
  };
})
