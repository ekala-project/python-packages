{
  lib,
  buildPythonPackage,
  fetchFromGitHub,

  # build-system
  hatch-vcs,
  hatchling,

  # dependencies
  burner-redis,
  cloudpickle,
  cronsim,
  opentelemetry-api,
  opentelemetry-sdk,
  prometheus-client,
  py-key-value-aio,
  python-json-logger,
  redis,
  rich,
  typer,
  typing-extensions,
  uncalled-for,
}:

buildPythonPackage (finalAttrs: {
  pname = "pydocket";
  version = "0.23.0";
  pyproject = true;
  __structuredAttrs = true;

  src = fetchFromGitHub {
    owner = "chrisguidry";
    repo = "docket";
    tag = finalAttrs.version;
    hash = "sha256-CmdZiamJmhIVgHzntprcyOyVskSkdDH3kL9Lju7wvKw=";
  };

  build-system = [
    hatch-vcs
    hatchling
  ];

  dependencies = [
    burner-redis
    cloudpickle
    cronsim
    opentelemetry-api
    prometheus-client
    py-key-value-aio
    python-json-logger
    redis
    rich
    typer
    typing-extensions
    uncalled-for
  ]
  ++ py-key-value-aio.optional-dependencies.memory;

  optional-dependencies = {
    metrics = [
      opentelemetry-sdk
    ];
  };

  pythonImportsCheck = [ "docket" ];

  meta = {
    description = "Distributed background task system for Python";
    homepage = "https://github.com/chrisguidry/docket";
    license = lib.licenses.mit;
    maintainers = [ ];
  };
})
