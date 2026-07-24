{
  lib,
  fetchPypi,
  buildPythonPackage,
  setuptools,
  jinja2,
  sphinx,
  tabulate,
}:

buildPythonPackage rec {
  pname = "numpydoc";
  version = "1.10.0";
  pyproject = true;

  src = fetchPypi {
    inherit pname version;
    hash = "sha256-P3lw9u7jCRImCmsxrHK7okMoMM1nIlaewX7o0+9f+gE=";
  };

  build-system = [ setuptools ];

  dependencies = [
    jinja2
    sphinx
    tabulate
  ];

  pythonImportsCheck = [ "numpydoc" ];

  meta = {
    description = "Sphinx extension to support docstrings in Numpy format";
    homepage = "https://github.com/numpy/numpydoc";
    license = lib.licenses.free;
  };
}
