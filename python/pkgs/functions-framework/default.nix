{
  lib,
  buildPythonPackage,
  fetchFromGitHub,
  pythonAtLeast,

  # build-system
  setuptools,

  # dependencies
  click,
  cloudevents,
  deprecation,
  flask,
  gunicorn,
  starlette,
  uvicorn,
  uvicorn-worker,
  watchdog,
  werkzeug,

  # tests
  docker,
  httpx,
  pretend,
  pytest-asyncio,
  requests,
}:

buildPythonPackage (finalAttrs: {
  pname = "functions-framework";
  version = "3.10.2";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "GoogleCloudPlatform";
    repo = "functions-framework-python";
    tag = "v${finalAttrs.version}";
    hash = "sha256-JiDerfEXlamZWzHxZaTJN/QFMXSph5YDtRsZM4hb4hs=";
  };

  build-system = [ setuptools ];

  pythonRelaxDeps = [
    "cloudevents"
  ];
  dependencies = [
    click
    cloudevents
    deprecation
    flask
    gunicorn
    starlette
    uvicorn
    uvicorn-worker
    watchdog
    werkzeug
  ];
  pythonImportsCheck = [ "functions_framework" ];

  disabledTestPaths = lib.optionals (pythonAtLeast "3.14") [
    # _pickle.PicklingError: Can't pickle local object <function Flask.__init__.<locals>.<lambda> at 0x7ffff47e54e0>
    "tests/test_timeouts.py"
  ];
  meta = {
    description = "FaaS (Function as a service) framework for writing portable Python functions";
    homepage = "https://github.com/GoogleCloudPlatform/functions-framework-python";
    license = lib.licenses.asl20;
    maintainers = [ ];
  };
})
