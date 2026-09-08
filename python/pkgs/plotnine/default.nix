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
  version = "0.15.8";
  pyproject = true;
  __structuredAttrs = true;

  src = fetchFromGitHub {
    owner = "has2k1";
    repo = "plotnine";
    tag = "v${finalAttrs.version}";
    hash = "sha256-maPKbS8+RPuZFMi1vgiQNWOB0VbHoCviOx5NtmM6VVQ=";
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
