{
  lib,
  buildPythonPackage,
  fetchFromGitHub,
  stdenvNoCC,

  # build system
  hatchling,

  # dependencies
  langgraph-checkpoint,
  ormsgpack,
  psycopg,
  psycopg-pool,

  # testing

  # passthru
  gitUpdater,
}:

buildPythonPackage (finalAttrs: {
  pname = "langgraph-checkpoint-postgres";
  version = "3.1.0";
  pyproject = true;
  __structuredAttrs = true;

  src = fetchFromGitHub {
    owner = "langchain-ai";
    repo = "langgraph";
    tag = "checkpointpostgres==${finalAttrs.version}";
    hash = "sha256-xSYJ9D86GuaJEgQYk+pkJ4O7HK6HXfAOGBv4f1CBY5g=";
  };

  postgresqlTestSetupPost = ''
    substituteInPlace tests/conftest.py \
      --replace-fail "DEFAULT_URI = \"postgres://postgres:postgres@localhost:5441/postgres?sslmode=disable\"" "DEFAULT_URI = \"postgres:///$PGDATABASE\"" \
      --replace-fail "DEFAULT_POSTGRES_URI = \"postgres://postgres:postgres@localhost:5441/\"" "DEFAULT_POSTGRES_URI = \"postgres:///\""
  '';

  sourceRoot = "${finalAttrs.src.name}/libs/checkpoint-postgres";

  build-system = [ hatchling ];

  dependencies = [
    langgraph-checkpoint
    ormsgpack
    psycopg
    psycopg-pool
  ];

  pythonRelaxDeps = [
    "langgraph-checkpoint"
    "psycopg-pool"
  ];

  doCheck = !(stdenvNoCC.hostPlatform.isDarwin);
  pythonImportsCheck = [ "langgraph.checkpoint.postgres" ];

  passthru = {
    # python updater script sets the wrong tag
    skipBulkUpdate = true;
    updateScript = gitUpdater {
      rev-prefix = "checkpointpostgres==";
      ignoredVersions = "a|b|dev|rc";
    };
  };

  meta = {
    description = "Library with a Postgres implementation of LangGraph checkpoint saver";
    homepage = "https://github.com/langchain-ai/langgraph/tree/main/libs/checkpoint-postgres";
    license = lib.licenses.mit;
    maintainers = [ ];
  };
})
