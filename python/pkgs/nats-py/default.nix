{
  lib,
  stdenv,
  aiohttp,
  buildPythonPackage,
  fetchFromGitHub,
  nkeys,
  pynacl,
  uv-build,
}:

buildPythonPackage (finalAttrs: {
  pname = "nats-py";
  version = "2.15.0";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "nats-io";
    repo = "nats.py";
    tag = "v${finalAttrs.version}";
    hash = "sha256-rs+C++g21dKZ6c7L5dJYqWSiv4J8qMGobW7R8icUfVw=";
  };

  sourceRoot = "${finalAttrs.src.name}/nats";

  postPatch = ''
    substituteInPlace pyproject.toml \
      --replace-fail "uv_build>=0.9.28,<0.10.0" "uv_build"
  '';

  build-system = [ uv-build ];

  dependencies = [ pynacl ];

  optional-dependencies = {
    aiohttp = [ aiohttp ];
    nkeys = [ nkeys ];
    # fast_parse = [ fast-mail-parser ];
  };
  pythonImportsCheck = [ "nats" ];

  meta = {
    description = "Python client for NATS.io";
    homepage = "https://github.com/nats-io/nats.py";
    license = lib.licenses.asl20;
    maintainers = [ ];
  };
})
