{
  lib,
  buildPythonPackage,
  fetchFromGitHub,

  # build
  hatchling,

  # runtime
  jsonschema,
  packaging,
  python-json-logger,
  pyyaml,
  referencing,
  rfc3339-validator,
  rfc3986-validator,
  traitlets,

  # optionals
  click,
  rich,

  # tests
  pytest-asyncio,
  pytest-console-scripts,
}:

buildPythonPackage rec {
  pname = "jupyter-events";
  version = "0.12.0";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "jupyter";
    repo = "jupyter_events";
    tag = "v${version}";
    hash = "sha256-l/u0XRP6mjqXywVzRXTWSm4E5a6o2oCdOBGGzLb85Ek=";
  };

  build-system = [ hatchling ];

  dependencies = [
    jsonschema
    packaging
    python-json-logger
    pyyaml
    referencing
    rfc3339-validator
    rfc3986-validator
    traitlets
  ]
  ++ jsonschema.optional-dependencies.format-nongpl;

  optional-dependencies = {
    cli = [
      click
      rich
    ];
  };
  meta = {
    description = "Configurable event system for Jupyter applications and extensions";
    mainProgram = "jupyter-events";
    homepage = "https://github.com/jupyter/jupyter_events";
    license = lib.licenses.bsd3;
    teams = [ lib.teams.jupyter ];
  };
}
