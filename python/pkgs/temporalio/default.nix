{
  lib,
  buildPythonPackage,
  fetchFromGitHub,
  rustPlatform,
  buildPackages,

  # build-system
  maturin,

  # dependencies
  nexusrpc,
  protobuf,
  types-protobuf,
  typing-extensions,

  # nativeBuildInputs
  cargo,
  rustc,
}:

buildPythonPackage rec {
  pname = "temporalio";
  version = "1.30.0";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "temporalio";
    repo = "sdk-python";
    tag = version;
    fetchSubmodules = true;
    hash = "sha256-8bCkm2b66CUSfIri0PhDLCijFSQR82wzAQKjdlk8VBg=";
  };

  cargoDeps = rustPlatform.fetchCargoVendor {
    inherit
      pname
      version
      src
      cargoRoot
      ;
    hash = "sha256-CnQ3xwja9ZnQQy7OEwtX/WtYsPtyREBkXpjx3JAeBKo=";
  };

  cargoRoot = "temporalio/bridge";

  build-system = [
    maturin
  ];

  env.PROTOC = "${lib.getExe buildPackages.protobuf}";

  dependencies = [
    nexusrpc
    protobuf
    types-protobuf
    typing-extensions
  ];

  nativeBuildInputs = [
    cargo
    rustPlatform.cargoSetupHook
    rustPlatform.maturinBuildHook
    rustc
  ];

  pythonRelaxDeps = [
    "protobuf"
  ];

  pythonImportsCheck = [
    "temporalio"
    "temporalio.bridge.temporal_sdk_bridge"
    "temporalio.client"
    "temporalio.worker"
  ];

  meta = {
    description = "Temporal Python SDK";
    homepage = "https://temporal.io/";
    license = lib.licenses.mit;
    maintainers = [ ];
  };
}
