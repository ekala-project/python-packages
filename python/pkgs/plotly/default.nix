{
  lib,
  buildPythonPackage,
  fetchFromGitHub,

  # build-system
  hatchling,

  # dependencies
  narwhals,
  packaging,

  # optional-dependencies
  numpy,
}:

buildPythonPackage (finalAttrs: {
  pname = "plotly";
  version = "7.0.0";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "plotly";
    repo = "plotly.py";
    tag = "v${finalAttrs.version}";
    hash = "sha256-UzKH0eVBCaR015bFeDCPBXiMI1/R/EAl7tf5uwRqw2w=";
  };

  env.SKIP_NPM = true;

  build-system = [
    hatchling
  ];

  dependencies = [
    narwhals
    packaging
  ];

  optional-dependencies = {
    express = [ numpy ];
  };

  pythonImportsCheck = [ "plotly" ];

  meta = {
    description = "Python plotting library for collaborative, interactive, publication-quality graphs";
    homepage = "https://plot.ly/python/";
    downloadPage = "https://github.com/plotly/plotly.py";
    license = lib.licenses.mit;
  };
})
