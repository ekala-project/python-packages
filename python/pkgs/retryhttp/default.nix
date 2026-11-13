{
  lib,
  buildPythonPackage,
  fetchFromGitHub,
  # build system
  setuptools,
  setuptools-scm,
  # runtime
  httpx,
  pydantic,
  requests,
  tenacity,
  types-requests,
}:

buildPythonPackage (finalAttrs: {
  pname = "retryhttp";
  version = "1.5.0";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "austind";
    repo = "retryhttp";
    tag = "v${finalAttrs.version}";
    hash = "sha256-MPS1oAtXNmqZMKHJmt0QQgwr2gZhnrg0M2G4/PGlUhI=";
  };

  build-system = [
    setuptools
    setuptools-scm
  ];

  dependencies = [
    httpx
    pydantic
    requests
    tenacity
    types-requests
  ];

  pythonImportsCheck = [ "retryhttp" ];

  meta = {
    description = "Retry potentially transient HTTP errors in Python";
    homepage = "https://github.com/austind/retryhttp";
    license = lib.licenses.apsl20;
  };
})
