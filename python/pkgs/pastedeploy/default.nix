{
  lib,
  fetchPypi,
  buildPythonPackage,
  setuptools,
}:

buildPythonPackage (finalAttrs: {
  pname = "PasteDeploy";
  version = "3.1.0";
  pyproject = true;

  src = fetchPypi {
    inherit (finalAttrs) pname version;
    hash = "sha256-nduvFS+AlUOKn+gfgseKZxS5KujgZr7UGLan/2oJWpU=";
  };

  build-system = [ setuptools ];

  pythonImportsCheck = [ "paste.deploy" ];

  meta = {
    description = "Load, configure, and compose WSGI applications and servers";
    homepage = "https://github.com/Pylons/pastedeploy";
    license = lib.licenses.mit;
  };
})
