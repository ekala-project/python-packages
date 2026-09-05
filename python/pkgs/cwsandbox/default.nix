{
  lib,
  buildPythonPackage,
  fetchFromGitHub,

  # build-system
  hatchling,

  # dependencies
  cryptography,
  googleapis-common-protos,
  grpcio,
  protobuf,

  # optional-dependencies
  click,

  # tests
  pytest-asyncio,
  pytest-dotenv,
}:

buildPythonPackage (finalAttrs: {
  pname = "cwsandbox";
  version = "1.14.2";
  pyproject = true;
  __structuredAttrs = true;

  src = fetchFromGitHub {
    owner = "coreweave";
    repo = "cwsandbox-client";
    tag = "v${finalAttrs.version}";
    hash = "sha256-mJEizdtgekxHpRIYnQrliJwpUhl3CbuYuAM2B7mO4GQ=";
  };

  build-system = [
    hatchling
  ];

  pythonRelaxDeps = [
    "protobuf"
  ];
  dependencies = [
    cryptography
    googleapis-common-protos
    grpcio
    protobuf
  ];

  optional-dependencies = {
    cli = [
      click
    ];
  };

  pythonImportsCheck = [ "cwsandbox" ];
  meta = {
    description = "Python client library for CoreWeave Sandbox";
    homepage = "https://github.com/coreweave/cwsandbox-client";
    license = with lib.licenses; [
      asl20
      bsd3
    ];
    maintainers = [ ];
  };
})
