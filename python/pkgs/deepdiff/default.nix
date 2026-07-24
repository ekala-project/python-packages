{
  lib,
  buildPythonPackage,
  fetchFromGitHub,

  # build-system
  flit-core,

  # dependencies
  orderly-set,

  # optional-dependencies
  click,
  orjson,
  pyyaml,
}:

buildPythonPackage rec {
  pname = "deepdiff";
  version = "9.0.0";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "seperman";
    repo = "deepdiff";
    tag = version;
    hash = "sha256-+QHYYts6FGOrg01+SjUQTxW6kjbwIG3NVSKDYKWvels=";
  };

  build-system = [
    flit-core
  ];

  dependencies = [
    orderly-set
  ];

  optional-dependencies = {
    cli = [
      click
      pyyaml
    ];
    optimize = [
      orjson
    ];
  };

  pythonImportsCheck = [ "deepdiff" ];

  meta = {
    description = "Deep Difference and Search of any Python object/data";
    mainProgram = "deep";
    homepage = "https://github.com/seperman/deepdiff";
    license = lib.licenses.mit;
  };
}
