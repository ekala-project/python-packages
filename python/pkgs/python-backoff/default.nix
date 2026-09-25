{
  buildPythonPackage,
  fetchFromGitHub,
  hatchling,
  lib,
  pytest-asyncio,
  requests,
  responses,
}:

buildPythonPackage (finalAttrs: {
  pname = "python-backoff";
  version = "3.0.0";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "python-backoff";
    repo = "backoff";
    tag = "v${finalAttrs.version}";
    hash = "sha256-y/L27SVOktR1FemVrCgrY1s28t8OxZ7rKqOB7zz8TC8=";
  };

  build-system = [ hatchling ];

  pythonImportsCheck = [ "backoff" ];
  meta = {
    description = "Python library providing function decorators for configurable backoff and retry";
    homepage = "https://github.com/python-backoff/backoff";
    license = lib.licenses.mit;
  };
})
