{
  buildPythonPackage,
  fetchPypi,
  lib,
  setuptools,
}:

buildPythonPackage (finalAttrs: {
  pname = "lcn-frontend";
  version = "0.2.9";
  pyproject = true;

  src = fetchPypi {
    pname = "lcn_frontend";
    inherit (finalAttrs) version;
    hash = "sha256-JQcnfBqwlDp31XRg2yBG9HZ8j4avxp57Qa3gBqT+67I=";
  };

  build-system = [ setuptools ];

  pythonImportsCheck = [ "lcn_frontend" ];

  # upstream has no tests

  meta = {
    description = "LCN panel for Home Assistant";
    homepage = "https://github.com/alengwenus/lcn-frontend";
    license = lib.licenses.mit;
  };
})
