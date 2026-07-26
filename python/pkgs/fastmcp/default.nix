{
  lib,
  buildPythonPackage,
  fetchFromGitHub,

  # build-system
  hatchling,
  uv-dynamic-versioning,

  # dependencies
  fastmcp-slim,
}:

buildPythonPackage (finalAttrs: {
  pname = "fastmcp";
  version = "3.3.1";
  pyproject = true;
  __structuredAttrs = true;

  src = fetchFromGitHub {
    owner = "PrefectHQ";
    repo = "fastmcp";
    tag = "v${finalAttrs.version}";
    hash = "sha256-1W5NbWIULxFXGSozZEeITcPt1EbY6IsJLQdyevcn9BI=";
  };

  postPatch = ''
    substituteInPlace pyproject.toml \
      --replace-fail "timeout = 5" "timeout = 50"
  '';

  build-system = [
    hatchling
    uv-dynamic-versioning
  ];

  dependencies = [
    fastmcp-slim
  ]
  ++ fastmcp-slim.optional-dependencies.client
  ++ fastmcp-slim.optional-dependencies.server;

  optional-dependencies = {
    anthropic = fastmcp-slim.optional-dependencies.anthropic;
    apps = fastmcp-slim.optional-dependencies.apps;
    azure = fastmcp-slim.optional-dependencies.azure;
    code-mode = fastmcp-slim.optional-dependencies.code-mode;
    gemini = fastmcp-slim.optional-dependencies.gemini;
    openai = fastmcp-slim.optional-dependencies.openai;
    tasks = fastmcp-slim.optional-dependencies.tasks;
  };

  pythonImportsCheck = [ "fastmcp" ];

  meta = {
    description = "Fast, Pythonic way to build MCP servers and clients";
    homepage = "https://github.com/PrefectHQ/fastmcp";
    license = lib.licenses.asl20;
    maintainers = [ ];
  };
})
