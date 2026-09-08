{
  lib,
  buildPythonPackage,
  fetchPypi,
  setuptools,
  cssselect,
  lxml,
}:

buildPythonPackage rec {
  pname = "pyquery";
  version = "2.1.0";
  pyproject = true;

  src = fetchPypi {
    inherit pname version;
    hash = "sha256-dSODiHUPxuJUt6UvdxAnub6zpiAriASL71KgCwq+rbs=";
  };

  build-system = [ setuptools ];

  dependencies = [
    cssselect
    lxml
  ];

  pythonImportsCheck = [ "pyquery" ];

  meta = {
    description = "Jquery-like library for Python";
    homepage = "https://github.com/gawel/pyquery";
    license = lib.licenses.bsd3;
  };
}
