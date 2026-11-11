{
  lib,
  buildPythonPackage,
  fetchPypi,

  # build-system
  setuptools-scm,

  # dependencies
  werkzeug,
}:

buildPythonPackage (finalAttrs: {
  pname = "pytest-localserver";
  version = "0.10.0.post0";
  pyproject = true;

  src = fetchPypi {
    pname = "pytest_localserver";
    inherit (finalAttrs) version;
    hash = "sha256-BsIaZmCdhitCvZy4FjNIIOaW6o93ys3f4VkSfUhkmFE=";
  };

  build-system = [ setuptools-scm ];

  dependencies = [ werkzeug ];

  pythonImportsCheck = [ "pytest_localserver" ];

  meta = {
    description = "Plugin for the pytest testing framework to test server connections locally";
    homepage = "https://github.com/pytest-dev/pytest-localserver";
    license = lib.licenses.mit;
  };
})
