{
  lib,
  buildPythonPackage,
  fetchFromGitHub,

  # build-system
  setuptools,

  # dependencies
  boto3,
  mlflow-skinny,

  # tests
  matplotlib,
  pandas,
  scikit-learn,
  skops,
}:

buildPythonPackage (finalAttrs: {
  pname = "sagemaker-mlflow";
  version = "0.5.0";
  pyproject = true;
  __structuredAttrs = true;

  src = fetchFromGitHub {
    owner = "aws";
    repo = "sagemaker-mlflow";
    tag = "v${finalAttrs.version}";
    hash = "sha256-nSI1BGJ2hhzuHxnGjElDuPpuc2rRn2mX5+s4ZSuZna0=";
  };

  # AssertionError: sagemaker_mlflow version is dev - 0.5.0.dev1
  postPatch = ''
    substituteInPlace VERSION \
      --replace-fail \
        "0.5.0.dev1" \
        "${finalAttrs.version}"
  '';

  build-system = [
    setuptools
  ];

  dependencies = [
    boto3
    mlflow-skinny
  ];

  pythonImportsCheck = [ "sagemaker_mlflow" ];
  # mlflow.exceptions.MlflowException: The filesystem tracking backend (e.g., './mlruns') is in maintenance mode and will not receive further updates.
  # Please migrate to a database backend (e.g., 'sqlite:///mlflow.db') to access the latest MLflow features.
  meta = {
    description = "MLFlow plugin for SageMaker";
    homepage = "https://github.com/aws/sagemaker-mlflow";
    license = lib.licenses.asl20;
    maintainers = [ ];
  };
})
