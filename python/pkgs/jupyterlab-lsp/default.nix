{
  lib,
  buildPythonPackage,
  fetchPypi,
  setuptools,
  jupyterlab,
  jupyter-lsp,
}:

buildPythonPackage (finalAttrs: {
  pname = "jupyterlab-lsp";
  version = "5.3.0";
  pyproject = true;

  src = fetchPypi {
    pname = "jupyterlab_lsp";
    inherit (finalAttrs) version;
    hash = "sha256-vfAU/rwOwpf/aQh+lXVJ1yTrDCnfPyTU9MQHWKca/D8=";
  };

  nativeBuildInputs = [ setuptools ];

  dependencies = [
    jupyterlab
    jupyter-lsp
  ];
  # No tests
  pythonImportsCheck = [ "jupyterlab_lsp" ];

  meta = {
    description = "Language Server Protocol integration for Jupyter(Lab)";
    homepage = "https://github.com/jupyter-lsp/jupyterlab-lsp";
    license = lib.licenses.bsd3;
    platforms = lib.platforms.all;
  };
})
