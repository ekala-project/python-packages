{
  lib,
  buildPythonPackage,
  fetchFromGitHub,
  pythonAtLeast,

  # build-system
  hatchling,
  uv-dynamic-versioning,

  # dependencies
  docstring-parser,
  typing-extensions,

  # optional-dependencies
  tomli,
  tomli-w,
  pyyaml,

  # tests
  matplotlib,
  numpy,
  pytest-benchmark,
  pytest-regressions,
}:

buildPythonPackage (finalAttrs: {
  pname = "simple-parsing";
  version = "0.1.8";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "lebrice";
    repo = "SimpleParsing";
    tag = "v${finalAttrs.version}";
    hash = "sha256-Nsr+I+BoVxockRGQAjG+ushRQ4CtWgkHrg5aVorSrvw=";
  };

  build-system = [
    hatchling
    uv-dynamic-versioning
  ];

  dependencies = [
    docstring-parser
    typing-extensions
  ];

  optional-dependencies = {
    toml = [
      tomli
      tomli-w
    ];
    yaml = [ pyyaml ];
  };

  pythonImportsCheck = [ "simple_parsing" ];
  meta = {
    description = "Simple, Elegant, Typed Argument Parsing with argparse";
    homepage = "https://github.com/lebrice/SimpleParsing";
    license = lib.licenses.mit;
    maintainers = [ ];
  };
})
