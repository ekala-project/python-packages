{
  lib,
  buildPythonPackage,
  fetchPypi,
  # build-system
  setuptools,
  pytest,
  jupyter-client,
  ipykernel,
  nbformat,
  nbconvert,
  param,
  pyflakes,
}:

buildPythonPackage (finalAttrs: {
  pname = "nbsmoke";
  version = "0.6.1a1";
  pyproject = true;

  src = fetchPypi {
    inherit (finalAttrs) pname version;
    sha256 = "sha256-mIdr4mppQqKGBdlLwLECCvKgwYmGMY1zjq/gzV0urRQ=";
  };

  build-system = [ setuptools ];

  dependencies = [
    pytest
    jupyter-client
    ipykernel
    nbformat
    nbconvert
    param
    pyflakes
  ];

  # tests not included with pypi release
  pythonImportsCheck = [ "nbsmoke" ];

  meta = {
    description = "Basic notebook checks and linting";
    homepage = "https://github.com/pyviz/nbsmoke";
    license = lib.licenses.bsd3;
  };
})
