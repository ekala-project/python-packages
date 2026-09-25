{
  lib,
  buildPythonPackage,
  fetchFromGitHub,

  # build-system
  hatchling,

  # dependencies
  click,
  croniter,
  redis,
}:

buildPythonPackage (finalAttrs: {
  pname = "rq";
  version = "2.12";
  pyproject = true;
  __structuredAttrs = true;

  src = fetchFromGitHub {
    owner = "rq";
    repo = "rq";
    tag = "v${finalAttrs.version}";
    hash = "sha256-EGgOeATfuRONPxfbgBqrgK8tk4Ehg9El7bTGOVX4cLY=";
  };

  build-system = [ hatchling ];

  dependencies = [
    click
    croniter
    redis
  ];

  pythonImportsCheck = [ "rq" ];

  meta = {
    description = "Library for creating background jobs and processing them";
    homepage = "https://github.com/nvie/rq/";
    license = lib.licenses.bsd2;
  };
})
