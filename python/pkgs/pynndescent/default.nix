{
  lib,
  buildPythonPackage,
  fetchFromGitHub,

  # build-system
  setuptools,

  # dependencies
  joblib,
  llvmlite,
  numba,
  scikit-learn,
  scipy,
}:

buildPythonPackage (finalAttrs: {
  pname = "pynndescent";
  version = "0.6.0";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "lmcinnes";
    repo = "pynndescent";
    tag = "release-${finalAttrs.version}";
    hash = "sha256-RfIbPPyx+Y7niuFrLjA02cUDHTSv9s5E4JiXv4ZBNEc=";
  };

  build-system = [ setuptools ];

  dependencies = [
    joblib
    llvmlite
    numba
    scikit-learn
    scipy
  ];

  pythonImportsCheck = [ "pynndescent" ];
  meta = {
    description = "Nearest Neighbor Descent";
    homepage = "https://github.com/lmcinnes/pynndescent";
    license = lib.licenses.bsd2;
    maintainers = [ ];
    badPlatforms = [
      # The majority of tests are crashing:
      # Fatal Python error: Segmentation fault
      "aarch64-linux"
    ];
  };
})
