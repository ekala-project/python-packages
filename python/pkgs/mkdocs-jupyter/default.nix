{
  lib,
  buildPythonPackage,
  fetchPypi,
  hatchling,
  ipykernel,
  jupytext,
  mkdocs,
  mkdocs-material,
  nbconvert,
  pygments,
  pytestCheckHook,
  pytest-cov-stub,
  writableTmpDirAsHomeHook,
}:

buildPythonPackage (finalAttrs: {
  pname = "mkdocs-jupyter";
  version = "0.27.0";
  pyproject = true;

  src = fetchPypi {
    pname = "mkdocs_jupyter";
    inherit (finalAttrs) version;
    hash = "sha256-JTBAW5YWU0uKi7gdpojE5hex9wTN/kwb2EYrBxuaTQM=";
  };

  pythonRelaxDeps = [
    "ipykernel"
    "nbconvert"
  ];

  build-system = [ hatchling ];

  nativeBuildInputs = [
    writableTmpDirAsHomeHook
  ];

  dependencies = [
    ipykernel
    jupytext
    mkdocs
    mkdocs-material
    nbconvert
    pygments
  ];

  nativeCheckInputs = [
    pytestCheckHook
    pytest-cov-stub
  ];

  pythonImportsCheck = [ "mkdocs_jupyter" ];

  __darwinAllowLocalNetworking = true;

  meta = {
    description = "Use Jupyter Notebook in mkdocs";
    homepage = "https://github.com/danielfrg/mkdocs-jupyter";
    license = lib.licenses.asl20;
  };
})
