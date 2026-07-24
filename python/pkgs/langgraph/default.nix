{
  lib,
  stdenv,
  buildPythonPackage,
  fetchFromGitHub,

  # build-system
  hatchling,

  # dependencies
  langchain-core,
  langgraph-checkpoint,
  langgraph-prebuilt,
  langgraph-sdk,
  pydantic,
  xxhash,

  # tests
  postgresql,

  # passthru
  nix-update-script,
}:
buildPythonPackage (finalAttrs: {
  pname = "langgraph";
  version = "1.2.7";
  pyproject = true;
  __structuredAttrs = true;

  src = fetchFromGitHub {
    owner = "langchain-ai";
    repo = "langgraph";
    tag = finalAttrs.version;
    hash = "sha256-Ws84VIh+IkL1oV4PmZacu56TW+S1JppCgDtK5datLY4=";
  };

  postgresqlTestSetupPost = ''
    substituteInPlace tests/conftest_store.py \
      --replace-fail "DEFAULT_POSTGRES_URI = \"postgres://postgres:postgres@localhost:5442/\"" "DEFAULT_POSTGRES_URI = \"postgres:///$PGDATABASE\""
    substituteInPlace tests/conftest_checkpointer.py \
      --replace-fail "DEFAULT_POSTGRES_URI = \"postgres://postgres:postgres@localhost:5442/\"" "DEFAULT_POSTGRES_URI = \"postgres:///$PGDATABASE\""
  '';

  sourceRoot = "${finalAttrs.src.name}/libs/langgraph";

  build-system = [ hatchling ];

  dependencies = [
    langchain-core
    langgraph-checkpoint
    langgraph-prebuilt
    langgraph-sdk
    pydantic
    xxhash
  ];

  pythonImportsCheck = [ "langgraph" ];

  # postgresql doesn't play nicely with the darwin sandbox:
  # FATAL:  could not create shared memory segment: Operation not permitted
  doCheck = !stdenv.hostPlatform.isDarwin;
  # Since `langgraph` is the only unprefixed package, we have to use an explicit match
  passthru = {
    skipBulkUpdate = true;
    updateScript = nix-update-script {
      extraArgs = [
        "--version-regex"
        "([0-9.]+)"
      ];
    };
  };

  meta = {
    description = "Build resilient language agents as graphs";
    homepage = "https://github.com/langchain-ai/langgraph";
    license = lib.licenses.mit;
    maintainers = [ ];
  };
})
