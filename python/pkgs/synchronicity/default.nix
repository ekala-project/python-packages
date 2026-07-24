{
  lib,
  stdenv,
  buildPythonPackage,
  fetchFromGitHub,

  # build-system
  hatchling,

  # dependencies
  typing-extensions,

  # optional-dependencies
  sigtools,

  # tests
  mypy,
  pytest-asyncio,
  pytest-markdown-docs,
  pythonOlder,
  gevent,
}:

buildPythonPackage (finalAttrs: {
  pname = "synchronicity";
  version = "0.12.5";
  pyproject = true;
  __structuredAttrs = true;

  src = fetchFromGitHub {
    owner = "modal-labs";
    repo = "synchronicity";
    tag = "v${finalAttrs.version}";
    hash = "sha256-npn6SX3NV0Vcq305zyi0jEFGpdyoTESpnDTyuf+WKsQ=";
  };

  build-system = [
    hatchling
  ];

  dependencies = [
    typing-extensions
  ];

  optional-dependencies = {
    compile = [ sigtools ];
  };
  pythonImportsCheck = [ "synchronicity" ];

  meta = {
    description = "Export blocking and async library versions from a single async implementation";
    homepage = "https://github.com/modal-labs/synchronicity";
    license = lib.licenses.asl20;
    maintainers = [ ];
  };
})
