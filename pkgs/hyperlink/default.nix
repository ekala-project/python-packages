{
  lib,
  fetchPypi,
  buildPythonPackage,
  setuptools,
  idna,
}:

buildPythonPackage rec {
  pname = "hyperlink";
  version = "21.0.0";
  pyproject = true;

  src = fetchPypi {
    inherit pname version;
    hash = "sha256-Qnr5V9qli8kJRxxsQPdMVFD6Ej3Qk/xT79LpHScFpWs=";
  };

  build-system = [ setuptools ];

  dependencies = [ idna ];

  doCheck = false;

  pythonImportsCheck = [ "hyperlink" ];

  meta = {
    description = "Featureful, correct URL for Python";
    homepage = "https://github.com/python-hyper/hyperlink";
    license = lib.licenses.mit;
  };
}
