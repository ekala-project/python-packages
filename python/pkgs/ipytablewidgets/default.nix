{
  lib,
  buildPythonPackage,
  fetchPypi,
  pytestCheckHook,
  ipywidgets,
  jupyter-packaging,
  jupyterlab,
  lz4,
  numpy,
  pandas,
  setuptools,
  traitlets,
}:

buildPythonPackage (finalAttrs: {
  pname = "ipytablewidgets";
  version = "0.3.4";
  pyproject = true;

  src = fetchPypi {
    inherit (finalAttrs) pname version;
    hash = "sha256-ni4933km+meObT131hsPWBckhBwjZBbQVG0iepNxjRk=";
  };

  postPatch = ''
    substituteInPlace pyproject.toml \
      --replace-fail '"setuptools>=40.8.0,<80"' '"setuptools>=40.8.0"'
  '';

  build-system = [
    jupyter-packaging
    jupyterlab
    setuptools
  ];

  dependencies = [
    ipywidgets
    lz4
    numpy
    pandas
    traitlets
  ];

  nativeCheckInputs = [ pytestCheckHook ];

  pythonImportsCheck = [ "ipytablewidgets" ];

  meta = {
    description = "Traitlets and widgets to efficiently data tables (e.g. Pandas DataFrame) using the jupyter notebook";
    homepage = "https://github.com/progressivis/ipytablewidgets";
    license = lib.licenses.bsd3;
  };
})
