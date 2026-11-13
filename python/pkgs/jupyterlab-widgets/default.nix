{
  lib,
  buildPythonPackage,
  fetchPypi,
  hatchling,
  hatch-jupyter-builder,
}:

buildPythonPackage (finalAttrs: {
  pname = "jupyterlab-widgets";
  version = "3.0.17";
  pyproject = true;

  src = fetchPypi {
    pname = "jupyterlab_widgets";
    inherit (finalAttrs) version;
    hash = "sha256-bmH+IcqKZgORgKXMUqQz4HJ50v7nnIvpY+ANVRk/F6g=";
  };

  # jupyter_builder is only needed to build the labextension from source,
  # but the sdist ships the pre-built assets; the hatch hook is provided by
  # hatch-jupyter-builder.
  postPatch = ''
    substituteInPlace pyproject.toml \
      --replace-fail '"jupyter_builder>=1.0"' ""
  '';

  build-system = [
    hatchling
    hatch-jupyter-builder
  ];

  # has no tests

  pythonImportsCheck = [ "jupyterlab_widgets" ];

  meta = {
    description = "Jupyter Widgets JupyterLab Extension";
    homepage = "https://github.com/jupyter-widgets/ipywidgets";
    license = lib.licenses.bsd3;
  };
})
