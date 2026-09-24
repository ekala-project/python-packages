{
  lib,
  buildPythonPackage,
  eval-type-backport,
  fetchPypi,
  hatchling,
  llama-index-instrumentation,
  pydantic,
}:

buildPythonPackage (finalAttrs: {
  pname = "llama-index-workflows";
  version = "2.23.3";
  pyproject = true;

  src = fetchPypi {
    pname = "llama_index_workflows";
    inherit (finalAttrs) version;
    hash = "sha256-+6FA6k1Kp+fKWPPdwlJrkr+zG/r0WrK0NFQBrlJwYbQ=";
  };

  postPatch = ''
        substituteInPlace pyproject.toml \
          --replace-fail 'requires = ["uv_build>=0.9.10,<0.10.0"]' 'requires = ["hatchling"]' \
          --replace-fail 'build-backend = "uv_build"' 'build-backend = "hatchling.build"'

        # hatchling can't auto-discover the package since the source uses a src
        # layout with "workflows" and "llama_agents" directories
        cat >> pyproject.toml <<'EOF'

    [tool.hatch.build.targets.wheel]
    packages = ["src/workflows", "src/llama_agents"]
    EOF
  '';

  build-system = [ hatchling ];

  dependencies = [
    eval-type-backport
    llama-index-instrumentation
    pydantic
  ];

  pythonImportsCheck = [ "workflows" ];

  meta = {
    description = "Event-driven, async-first, step-based way to control the execution flow of AI applications like Agents";
    homepage = "https://pypi.org/project/llama-index-workflows/";
    license = lib.licenses.mit;
    maintainers = [ ];
  };
})
