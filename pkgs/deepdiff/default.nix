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
  version = "8.6.2";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "seperman";
    repo = "deepdiff";
    tag = version;
    hash = "sha256-/XRPP8O2ykoXwOZ2ou/7Yoa1x7t45dCx6G3aq30o3Wc=";
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
