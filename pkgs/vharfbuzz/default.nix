{
  lib,
  buildPythonPackage,
  fetchPypi,

  # build-system
  setuptools,
  setuptools-scm,

  # dependencies
  fonttools,
  uharfbuzz,
}:

buildPythonPackage rec {
  pname = "vharfbuzz";
  version = "0.3.1";
  pyproject = true;

  src = fetchPypi {
    inherit pname version;
    hash = "sha256-zFVw8Nxh7cRJNk/S7D3uiIGShBMiZ/JeuSdX4hN94kc=";
  };

  build-system = [
    setuptools
    setuptools-scm
  ];

  dependencies = [
    fonttools
    uharfbuzz
  ];

  pythonImportsCheck = [ "vharfbuzz" ];

  meta = {
    homepage = "https://github.com/simoncozens/vharfbuzz";
    description = "A user-friendly wrapper around uharfbuzz";
    license = lib.licenses.asl20;
  };
}
