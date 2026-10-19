{
  lib,
  buildPythonPackage,
  fetchPypi,
  setuptools,
  portalocker,
}:

buildPythonPackage (finalAttrs: {
  pname = "applicationinsights";
  version = "0.11.10";
  pyproject = true;

  src = fetchPypi {
    inherit (finalAttrs) pname version;
    hash = "sha256-C3YfPvBoCs9HMZBt/BgH+qbypXFornRZLbAISmCZ97M=";
  };

  build-system = [ setuptools ];

  dependencies = [ portalocker ];

  pythonImportsCheck = [ "applicationinsights" ];

  meta = {
    description = "Application Insights API surface for Python";
    homepage = "https://github.com/Microsoft/ApplicationInsights-Python";
    license = lib.licenses.mit;
  };
})
