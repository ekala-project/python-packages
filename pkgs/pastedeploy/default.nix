{
  lib,
  fetchPypi,
  buildPythonPackage,
  setuptools,
}:

buildPythonPackage rec {
  pname = "PasteDeploy";
  version = "3.1.0";
  pyproject = true;

  src = fetchPypi {
    inherit pname version;
    hash = "sha256-nduvFS+AlUOKn+gfgseKZxS5KujgZr7UGLan/2oJWpU=";
  };

  build-system = [ setuptools ];

  pythonImportsCheck = [ "paste.deploy" ];

  meta = {
    description = "Load, configure, and compose WSGI applications and servers";
    homepage = "https://github.com/Pylons/pastedeploy";
    license = lib.licenses.mit;
  };
}
