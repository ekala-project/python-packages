{
  lib,
  buildPythonPackage,
  fastapi,
  fetchFromGitHub,
  limits,
  mock,
  hiro,
  httpx,
  poetry-core,
  redis,
  starlette,
}:

buildPythonPackage (finalAttrs: {
  pname = "slowapi";
  version = "0.1.10";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "laurentS";
    repo = "slowapi";
    tag = "v${finalAttrs.version}";
    hash = "sha256-YNL/xfs8fmkAGagMhqJX3tXoltjHznZjUrF/a2RWCDs=";
  };

  patches = [
    # https://github.com/laurentS/slowapi/pull/279
    ./starlette-1.0-compat.patch
  ];

  build-system = [ poetry-core ];

  dependencies = [
    limits
    redis
  ];
  pythonImportsCheck = [ "slowapi" ];

  meta = {
    description = "Python library for API rate limiting";
    homepage = "https://github.com/laurentS/slowapi";
    license = lib.licenses.mit;
    maintainers = [ ];
  };
})
