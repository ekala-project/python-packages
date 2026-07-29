{ lib
, buildPythonPackage
, fetchFromGitHub
, # build-system
  setuptools
, # dependencies
  alembic
, colorlog
, numpy
, packaging
, sqlalchemy
, tqdm
, pyyaml
, # optional-dependencies
  boto3
, cmaes
, google-cloud-storage
, grpcio
, matplotlib
, pandas
, plotly
, protobuf
, redis
, scikit-learn
, scipy
,
}:

buildPythonPackage (finalAttrs: {
  pname = "optuna";
  version = "4.9.0";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "optuna";
    repo = "optuna";
    tag = "v${finalAttrs.version}";
    hash = "sha256-BoRy5LSzMl9w5KS9BW1uHUTcEj1ZyYp4nWykPgq6ckI=";
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
