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
  version = "2.1.0";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "AnnMarieW";
    repo = "dash-bootstrap-templates";
    tag = "V${finalAttrs.version}";
    hash = "sha256-B7iyN4sJA6DmoLf3DpFEONDe5tUd4cBlDIH4E7JtULk=";
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
