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
  version = "3.3.16";
  pyproject = true;

  src = fetchPypi {
    inherit (finalAttrs) pname version;
    hash = "sha256-ptwnNtI9g+Ntsxj5Rgawppck9lKsVSNYWeqgJX8Ue8U=";
  };

  pythonRelaxDeps = [
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
  doCheck = false;

  pythonImportsCheck = [ "nbdev" ];

  meta = {
    homepage = "https://github.com/AnswerDotAI/nbdev";
    description = "Create delightful software with Jupyter Notebooks";
    license = lib.licenses.asl20;
    maintainers = [ ];
  };
})
