{
  lib,
  buildPythonPackage,
  fetchFromGitHub,
  flit-core,
  gitUpdater,
  opentelemetry-api,
  opentelemetry-sdk,
  pytest-asyncio,
  pytest-mock,
  std-uritemplate,
}:

buildPythonPackage (finalAttrs: {
  pname = "microsoft-kiota-abstractions";
  version = "1.12.1";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "microsoft";
    repo = "kiota-python";
    tag = "microsoft-kiota-abstractions-v${finalAttrs.version}";
    hash = "sha256-J33Bxo9TwHRCPzDw/Jduo9HHxoofB5h/HsNX6R9FfFI=";
  };

  sourceRoot = "${finalAttrs.src.name}/packages/abstractions/";

  build-system = [ flit-core ];

  dependencies = [
    opentelemetry-api
    opentelemetry-sdk
    std-uritemplate
  ];
  pythonImportsCheck = [ "kiota_abstractions" ];

  # detects the wrong tag on the repo
  passthru.skipBulkUpdate = true;

  passthru.updateScript = gitUpdater {
    rev-prefix = "microsoft-kiota-abstractions-v";
  };

  meta = {
    description = "Abstractions library for Kiota generated Python clients";
    homepage = "https://github.com/microsoft/kiota-python/tree/main/packages/abstractions/";
    license = lib.licenses.mit;
  };
})
