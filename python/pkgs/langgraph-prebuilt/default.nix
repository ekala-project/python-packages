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

  # tests
  langgraph-sdk,
  postgresql,

  # passthru
  gitUpdater,
}:
# langgraph-prebuilt isn't meant to be a standalone package but is bundled into langgraph at build time.
# It exists so the langgraph team can iterate on it without having to rebuild langgraph.
buildPythonPackage (finalAttrs: {
  pname = "langgraph-prebuilt";
  version = "1.1.0";
  pyproject = true;
  __structuredAttrs = true;

  src = fetchFromGitHub {
    owner = "langchain-ai";
    repo = "langgraph";
    tag = "prebuilt==${finalAttrs.version}";
    hash = "sha256-xSYJ9D86GuaJEgQYk+pkJ4O7HK6HXfAOGBv4f1CBY5g=";
  };

  sourceRoot = "${finalAttrs.src.name}/libs/prebuilt";

  build-system = [ hatchling ];

  dependencies = [
    langchain-core
    langgraph-checkpoint
    langgraph-sdk
  ];

  skipPythonImportsCheck = true; # This will be packaged with langgraph

  # postgresql doesn't play nicely with the darwin sandbox:
  # FATAL:  could not create shared memory segment: Operation not permitted
  doCheck = !stdenv.hostPlatform.isDarwin;
  passthru = {
    # python updater script sets the wrong tag
    skipBulkUpdate = true;
    updateScript = gitUpdater {
      rev-prefix = "prebuilt==";
      ignoredVersions = "a|b|dev|rc";
    };
  };

  meta = {
    description = "Prebuilt agents add-on for Langgraph. Should always be bundled with langgraph";
    homepage = "https://github.com/langchain-ai/langgraph/tree/main/libs/prebuilt";
    license = lib.licenses.mit;
    maintainers = [ ];
  };
})
