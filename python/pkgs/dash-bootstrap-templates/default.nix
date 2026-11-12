{
  lib,
  buildPythonPackage,
  fetchFromGitHub,
  setuptools,
  setuptools-scm,
  dash,
  dash-bootstrap-components,
  numpy,
}:

buildPythonPackage (finalAttrs: {
  pname = "dash-bootstrap-templates";
  version = "3.0.1";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "AnnMarieW";
    repo = "dash-bootstrap-templates";
    tag = "V${finalAttrs.version}";
    hash = "sha256-GYL8shd8B5kdBhjurirtAMBIbPyQNbZL4+3WyTn2Qsw=";
  };
  build-system = [
    setuptools
    setuptools-scm
  ];

  dependencies = [
    dash
    dash-bootstrap-components
    numpy
  ];

  pythonImportsCheck = [ "dash_bootstrap_templates" ];

  # There are no tests.

  meta = {
    description = "Collection of 52 Plotly figure templates with a Bootstrap theme";
    homepage = "https://github.com/AnnMarieW/dash-bootstrap-templates";
    license = lib.licenses.mit;
  };
})
