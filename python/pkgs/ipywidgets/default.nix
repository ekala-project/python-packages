{
  buildPythonPackage,
  fetchPypi,
  setuptools,
  comm,
  ipykernel,
  ipython,
  jsonschema,
  jupyterlab-widgets,
  lib,
  pytz,
  traitlets,
  widgetsnbextension,
}:

buildPythonPackage rec {
  pname = "ipywidgets";
  version = "8.1.8";
  pyproject = true;

  src = fetchPypi {
    inherit pname version;
    hash = "sha256-YflpMGuV+F+6a2mGt/5F1zEk0dnjAjqAaHENR6Iupmg=";
  };

  build-system = [ setuptools ];

  dependencies = [
    comm
    ipython
    jupyterlab-widgets
    traitlets
    widgetsnbextension
  ];
  meta = {
    description = "IPython HTML widgets for Jupyter";
    homepage = "https://github.com/jupyter-widgets/ipywidgets";
    license = lib.licenses.bsd3;
  };
}
