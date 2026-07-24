{
  lib,
  buildPythonPackage,
  fetchPypi,
  setuptools,
  setuptools-scm,
  param,
  pyct,
  pytest-mpl,
}:

buildPythonPackage rec {
  pname = "colorcet";
  version = "3.2.1";
  pyproject = true;

  src = fetchPypi {
    inherit pname version;
    hash = "sha256-SNmmfm5Z3FwKllqhtG/l1Zzclcw2qVlJ8pMT+VCsWfc=";
  };

  build-system = [
    setuptools
    setuptools-scm
  ];

  dependencies = [
    param
    pyct
  ];
  pythonImportsCheck = [ "colorcet" ];

  meta = {
    description = "Collection of perceptually uniform colormaps";
    mainProgram = "colorcet";
    homepage = "https://colorcet.pyviz.org";
    license = lib.licenses.cc-by-40;
    maintainers = [ ];
  };
}
