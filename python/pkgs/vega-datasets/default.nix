{
  lib,
  buildPythonPackage,
  fetchPypi,
  setuptools,
  pandas,
}:

buildPythonPackage (finalAttrs: {
  pname = "vega-datasets";
  version = "0.9.0";
  pyproject = true;

  src = fetchPypi {
    pname = "vega_datasets";
    inherit (finalAttrs) version;
    hash = "sha256-nb6YNCCOjsMqtElw3zFd6RAoYeTNoT2OFDqreoDZP8A=";
  };

  nativeBuildInputs = [ setuptools ];

  dependencies = [ pandas ];

  pythonImportsCheck = [ "vega_datasets" ];

  meta =
    let
      tag = lib.removeSuffix ".0" "v${finalAttrs.version}";
    in
    {
      description = "Python package for offline access to vega datasets";
      homepage = "https://github.com/altair-viz/vega_datasets";
      license = lib.licenses.mit;
    };
})
