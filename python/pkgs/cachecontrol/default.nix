{
  lib,
  buildPythonPackage,
  fetchFromGitHub,
  filelock,
  flit-core,
  msgpack,
  redis,
  requests,
}:

buildPythonPackage rec {
  pname = "cachecontrol";
  version = "0.14.4";
  pyproject = true;
  src = fetchFromGitHub {
    owner = "ionrock";
    repo = "cachecontrol";
    tag = "v${version}";
    hash = "sha256-627SqJocVOO0AfI8vswPqOr15MA/Lx7RLAdRAXzWu84=";
  };

  postPatch = ''
    substituteInPlace pyproject.toml \
      --replace-fail 'requires = ["uv_build>=0.9.6,<0.10.0"]' 'requires = ["flit_core>=3.2,<4"]' \
      --replace-fail 'build-backend = "uv_build"' 'build-backend = "flit_core.buildapi"'

    # flit-core derives module name from project name (CacheControl) but the
    # actual module directory is lowercase "cachecontrol"
    echo -e '\n[tool.flit.module]\nname = "cachecontrol"' >> pyproject.toml
  '';

  build-system = [ flit-core ];

  dependencies = [
    msgpack
    requests
  ];

  optional-dependencies = {
    filecache = [ filelock ];
    redis = [ redis ];
  };
  meta = {
    description = "Httplib2 caching for requests";
    mainProgram = "doesitcache";
    homepage = "https://github.com/ionrock/cachecontrol";
    license = lib.licenses.asl20;
    maintainers = [ ];
  };
}
