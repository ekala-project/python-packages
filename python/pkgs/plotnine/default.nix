{
  lib,
  buildPythonPackage,
  fetchFromGitHub,

  # build-system
  setuptools-scm,

  # dependencies
  matplotlib,
  mizani,
  pandas,
  scipy,
  statsmodels,
}:

buildPythonPackage (finalAttrs: {
  pname = "plotnine";
  version = "0.15.7";
  pyproject = true;
  __structuredAttrs = true;

  src = fetchFromGitHub {
    owner = "has2k1";
    repo = "plotnine";
    tag = "v${finalAttrs.version}";
    hash = "sha256-7yM7NeUqaZvp/UUXbfpFb1V+9Z0Gz3MUBq1JydJeyDE=";
  };

  build-system = [ setuptools-scm ];

  dependencies = [
    matplotlib
    mizani
    pandas
    scipy
    statsmodels
  ];
  pythonImportsCheck = [ "plotnine" ];
  meta = {
    description = "Grammar of graphics for Python";
    homepage = "https://plotnine.readthedocs.io/";
    license = lib.licenses.mit;
    maintainers = [ ];
  };
})
