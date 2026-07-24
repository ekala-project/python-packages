{
  lib,
  buildPythonPackage,
  fetchPypi,
  hatch-jupyter-builder,
  hatchling,
  ipykernel,
  ipywidgets,
  psygnal,
  pydantic,
  typing-extensions,
  watchfiles,
}:

buildPythonPackage rec {
  pname = "anywidget";
  version = "0.9.21";
  pyproject = true;

  src = fetchPypi {
    inherit pname version;
    hash = "sha256-uNAXICmsQmVzBTxBbGpYeDhmFhIgi7OQ+gYHhi5ZSyc=";
  };

  # We do not need the jupyterlab build dependency, because we do not need to
  # build any JS components; these are present already in the PyPI artifact.
  #
  postPatch = ''
    substituteInPlace pyproject.toml \
      --replace '"jupyterlab==3.*"' ""
  '';

  build-system = [
    hatch-jupyter-builder
    hatchling
  ];

  dependencies = [
    ipywidgets
    psygnal
    typing-extensions
  ];
  pythonImportsCheck = [ "anywidget" ];

  meta = {
    description = "Custom jupyter widgets made easy";
    homepage = "https://github.com/manzt/anywidget";
    license = lib.licenses.mit;
    maintainers = [ ];
  };
}
