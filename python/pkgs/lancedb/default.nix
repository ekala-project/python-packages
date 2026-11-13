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
  buildPackages,
  pkg-config,

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

  src = fetchFromGitHub {
    owner = "lancedb";
    repo = "lancedb";
    tag = "python-v${finalAttrs.version}";
    hash = "sha256-OIoQCk0YlWpaaau4AiWxarvH4oy1rAjaS9yvs3mIzzo=";
  };

  patches = [
    # ethnum 1.5.2 fails to compile with current rustc (E0512); fixed in 1.5.3
    ./ethnum-1.5.3.patch
  ];

  buildAndTestSubdir = "python";

  cargoDeps = rustPlatform.fetchCargoVendor {
    inherit (finalAttrs)
      pname
      version
      src
      patches
      ;
    hash = "sha256-66gCuzzdOFK9XFUj7jE0VGEx7doNE8bXCTayzFYRCeA=";
  };

  build-system = [ rustPlatform.maturinBuildHook ];

  nativeBuildInputs = [
    pkg-config
    # protoc; `protobuf` in the python scope is the python library
    buildPackages.protobuf
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
  };
})
