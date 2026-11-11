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

buildPythonPackage (finalAttrs: {
  pname = "ipywidgets";
  version = "8.1.9";
  pyproject = true;

  src = fetchPypi {
    inherit (finalAttrs) pname version;
    hash = "sha256-vMy6OKbsMlP3o5yUPOpbmtAZmc4HE5YXGtvFHGpqhhM=";
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
})
