{
  lib,
  stdenv,
  buildPythonPackage,
  fetchFromGitHub,
  rustPlatform,
  pythonAtLeast,

  # buildInputs
  openssl,

  # nativeBuildInputs
  pkg-config,
  protobuf,

  # dependencies
  deprecation,
  lance-namespace,
  numpy,
  packaging,
  pyarrow,
  pydantic,
  tqdm,
  pythonOlder,
  overrides,

  # tests

  nix-update-script,
}:

buildPythonPackage (finalAttrs: {
  pname = "lancedb";
  version = "0.32.0";
  pyproject = true;
  __structuredAttrs = true;

  src = fetchFromGitHub {
    owner = "lancedb";
    repo = "lancedb";
    tag = "python-v${finalAttrs.version}";
    hash = "sha256-OIoQCk0YlWpaaau4AiWxarvH4oy1rAjaS9yvs3mIzzo=";
  };

  buildAndTestSubdir = "python";

  cargoDeps = rustPlatform.fetchCargoVendor {
    inherit (finalAttrs) pname version src;
    hash = "sha256-rfAhvC6byg134NF21CR5n0A0DL42CLGy7VvHi9aZUrw=";
  };

  build-system = [ rustPlatform.maturinBuildHook ];

  nativeBuildInputs = [
    pkg-config
    protobuf
    rustPlatform.cargoSetupHook
  ];

  buildInputs = [
    openssl
  ];

  dependencies = [
    deprecation
    lance-namespace
    numpy
    packaging
    pyarrow
    pydantic
    tqdm
  ]
  ++ lib.optionals (pythonOlder "3.12") [
    overrides
  ];

  pythonImportsCheck = [ "lancedb" ];
  passthru.updateScript = nix-update-script {
    extraArgs = [
      "--version-regex"
      "python-v(.*)"
    ];
  };

  meta = {
    description = "Developer-friendly, serverless vector database for AI applications";
    homepage = "https://github.com/lancedb/lancedb";
    license = lib.licenses.asl20;
    maintainers = [ ];
  };
})
