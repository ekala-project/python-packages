{
  lib,
  buildPythonPackage,
  fetchFromGitHub,
  filelock,
  msgpack,
  redis,
  requests,
  uv-build,
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
      --replace-fail "uv_build>=0.9.6,<0.10.0" uv_build
  '';

  build-system = [ uv-build ];

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
