{
  lib,
  buildPythonPackage,
  fetchFromGitHub,
  # build-system
  setuptools,
  # dependencies
  alembic,
  colorlog,
  numpy,
  packaging,
  sqlalchemy,
  tqdm,
  pyyaml,
  # optional-dependencies
  boto3,
  cmaes,
  google-cloud-storage,
  grpcio,
  matplotlib,
  pandas,
  plotly,
  protobuf,
  redis,
  scikit-learn,
  scipy,
}:

buildPythonPackage (finalAttrs: {
  pname = "optuna";
  version = "5.0.0";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "optuna";
    repo = "optuna";
    tag = "v${finalAttrs.version}";
    hash = "sha256-0x1xbljBPW8tZNS+XkLls9IuxAjEBPENsKc5ybKDpgY=";
  };

  build-system = [
    setuptools
  ];

  dependencies = [
    alembic
    colorlog
    numpy
    packaging
    sqlalchemy
    tqdm
    pyyaml
  ];

  optional-dependencies = {
    optional = [
      boto3
      cmaes
      google-cloud-storage
      grpcio
      matplotlib
      pandas
      plotly
      protobuf
      redis
      scikit-learn
      scipy
    ];
  };

  pythonImportsCheck = [ "optuna" ];

  meta = {
    description = "Hyperparameter optimization framework";
    homepage = "https://optuna.org/";
    license = lib.licenses.mit;
    mainProgram = "optuna";
    maintainers = [ ];
  };
})
