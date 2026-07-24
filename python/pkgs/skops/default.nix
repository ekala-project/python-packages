{
  lib,
  stdenv,
  buildPythonPackage,
  fetchFromGitHub,

  # build-system
  hatchling,

  # dependencies
  numpy,
  packaging,
  prettytable,
  scikit-learn,
  tabulate,

  # tests
  rich,
}:

buildPythonPackage (finalAttrs: {
  pname = "skops";
  version = "0.14";
  pyproject = true;
  __structuredAttrs = true;

  src = fetchFromGitHub {
    owner = "skops-dev";
    repo = "skops";
    tag = "v${finalAttrs.version}";
    hash = "sha256-AyrsXomc3vpfdqsBL51UmGXsjPsAJ+dx3uf3T8nPk/Y=";
  };

  build-system = [ hatchling ];

  dependencies = [
    numpy
    packaging
    prettytable
    scikit-learn
    tabulate
  ];
  optional-dependencies = {
    rich = [ rich ];
  };
  # Override the overly strict pyproject.toml:tool.pytest.ini_options.filterwarnings
  # https://github.com/skops-dev/skops/issues/523
  pythonImportsCheck = [ "skops" ];

  meta = {
    description = "Library for saving/loading, sharing, and deploying scikit-learn based models";
    homepage = "https://skops.readthedocs.io/en/stable";
    license = lib.licenses.mit;
    maintainers = [ lib.maintainers.bcdarwin ];
    mainProgram = "skops";
  };
})
