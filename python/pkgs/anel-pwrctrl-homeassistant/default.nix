{
  lib,
  buildPythonPackage,
  fetchPypi,
  # build-system
  setuptools,
}:
buildPythonPackage (finalAttrs: {
  pname = "anel-pwrctrl-homeassistant";
  version = "0.0.1.dev2";
  pyproject = true;

  src = fetchPypi {
    inherit (finalAttrs) version;
    pname = "anel_pwrctrl-homeassistant";
    hash = "sha256-AcsnYD9CeGAarm5QdweUF6CUFwUywhfmU46NG8+Cm4s=";
  };

  build-system = [ setuptools ];

  # No tests

  pythonImportsCheck = [ "anel_pwrctrl" ];

  meta = {
    description = "Discover and control ANEL NET-PwrCtrl devices";
    homepage = "https://github.com/mweinelt/anel-pwrctrl";
    license = lib.licenses.mit;
  };
})
