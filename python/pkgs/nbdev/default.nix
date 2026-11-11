{
  lib,
  build,
  buildPythonPackage,
  fetchPypi,
  setuptools,
  ipywidgets,
  fastcore,
  fastgit,
  astunparse,
  watchdog,
  execnb,
  ghapi,
  pyyaml,
}:

buildPythonPackage (finalAttrs: {
  pname = "nbdev";
  version = "3.3.28";
  pyproject = true;

  src = fetchPypi {
    inherit (finalAttrs) pname version;
    hash = "sha256-IH/PHOQxymnSiphHOt9ZPuAyotqiH40HULmvU/Gk7AQ=";
  };

  pythonRelaxDeps = [
    "fastcore"
    "ghapi"
    "ipywidgets"
  ];

  build-system = [
    build
    setuptools
  ];

  dependencies = [
    astunparse
    execnb
    fastcore
    fastgit
    ghapi
    ipywidgets
    pyyaml
    watchdog
  ];

  # no real tests

  pythonImportsCheck = [ "nbdev" ];

  meta = {
    homepage = "https://github.com/AnswerDotAI/nbdev";
    description = "Create delightful software with Jupyter Notebooks";
    license = lib.licenses.asl20;
  };
})
