{
  lib,
  fetchPypi,
  buildPythonPackage,
  setuptools,
  setuptools-scm,
  jinja2,
  sphinx,
  tabulate,
}:

buildPythonPackage (finalAttrs: {
  pname = "numpydoc";
  version = "1.11.0";
  pyproject = true;

  src = fetchPypi {
    inherit (finalAttrs) pname version;
    hash = "sha256-JtsK2qyAh+mNoFyGsRGY3v2WKu98IfTf/ScDyMbrQYc=";
  };

  build-system = [
    setuptools
    setuptools-scm
  ];

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
})
