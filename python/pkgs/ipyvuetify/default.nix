{
  lib,
  buildPythonPackage,
  fetchPypi,
  # Python Inputs
  setuptools,
  ipyvue,
}:

buildPythonPackage (finalAttrs: {
  pname = "ipyvuetify";
  version = "3.1.1";
  pyproject = true;

  # GitHub version tries to run npm (Node JS)
  src = fetchPypi {
    inherit (finalAttrs) pname version;
    hash = "sha256-U/RDoRtv8hFUx55Whjqm1W9vT7ReKk77mfry3Uy70Zs=";
  };

  # drop pynpm which tries to install node_modules; prebuilt assets ship in the sdist
  # jupyter-builder is listed but unused by setup.py
  postPatch = ''
    substituteInPlace pyproject.toml \
      --replace-fail '"jupyter-builder>=1.0.0", ' "" \
      --replace-fail ', "pynpm"' ""
  '';

  build-system = [ setuptools ];

  dependencies = [
    ipyvue
    setuptools
  ];

  pythonImportsCheck = [ "ipyvuetify" ];

  meta = {
    description = "Jupyter widgets based on Vuetify UI Components";
    homepage = "https://github.com/mariobuikhuizen/ipyvuetify";
    license = lib.licenses.mit;
  };
})
