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
  version = "6.7.0";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "plotly";
    repo = "plotly.py";
    tag = "v${finalAttrs.version}";
    hash = "sha256-gykhl1aBgKCkJVv507UJk4xdYaruV/aU+JLYmvyFYbY=";
  };

  patches = [
    ./numpy-2.4-in1d.patch
  ];

  postPatch = ''
    rm plotly/conftest.py
  '';

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
