{
  lib,
  buildPythonPackage,
  fetchPypi,
  # Python Inputs
  setuptools,
  ipywidgets,
}:

buildPythonPackage (finalAttrs: {
  pname = "ipyvue";
  version = "3.1.1";
  pyproject = true;

  src = fetchPypi {
    inherit (finalAttrs) pname version;
    hash = "sha256-ZtyXnMyFYNGn2MtfJNjVIcOABV2c/vb/9U7oVsH3cpo=";
  };

  # The sdist ships the prebuilt labextension; jupyterlab is only needed
  # to rebuild the JS assets from a git checkout.
  postPatch = ''
    substituteInPlace pyproject.toml \
      --replace-fail '"jupyterlab~=4.0",' ""
  '';

  build-system = [ setuptools ];

  dependencies = [ ipywidgets ];

  pythonImportsCheck = [ "ipyvue" ];

  meta = {
    description = "Jupyter widgets base for Vue libraries";
    homepage = "https://github.com/widgetti/ipyvue";
    license = lib.licenses.mit;
  };
})
