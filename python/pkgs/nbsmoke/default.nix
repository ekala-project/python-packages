{
  lib,
  buildPythonPackage,
  fetchPypi,
  pytest,
  jupyter-client,
  ipykernel,
  nbformat,
  nbconvert,
  param,
  pyflakes,
}:

buildPythonPackage rec {
  pname = "nbsmoke";
  version = "0.6.1a1";
  format = "setuptools";

  src = fetchPypi {
    inherit pname version;
    sha256 = "sha256-mIdr4mppQqKGBdlLwLECCvKgwYmGMY1zjq/gzV0urRQ=";
  };

  propagatedBuildInputs = [
    pytest
    jupyter-client
    ipykernel
    nbformat
    nbconvert
    param
    pyflakes
  ];

  # tests not included with pypi release
  doCheck = false;
  pythonImportsCheck = [ "nbsmoke" ];

  meta = {
    description = "Basic notebook checks and linting";
    homepage = "https://github.com/pyviz/nbsmoke";
    license = lib.licenses.bsd3;
    maintainers = [ ];
  };
}
