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
  version = "3.0";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "rq";
    repo = "rq";
    tag = "v${finalAttrs.version}";
    hash = "sha256-xLl667lQ0IcyCEUmo2BvdvvOQNYpRIzq3IvILXe2x68=";
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
