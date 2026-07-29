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
  version = "2.10";
  pyproject = true;
  __structuredAttrs = true;

  src = fetchFromGitHub {
    owner = "rq";
    repo = "rq";
    tag = "v${finalAttrs.version}";
    hash = "sha256-D5K9N5egGdysskfyjriANgytHWK0E+JMvyEpJt9QJyo=";
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
    maintainers = [ ];
  };
})
