{
  lib,
  buildPythonPackage,
  fetchFromGitHub,
  six,
  setuptools,
}:

buildPythonPackage (finalAttrs: {
  pname = "wsgi-intercept";
  version = "1.13.1";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "cdent";
    repo = "wsgi-intercept";
    tag = "v${finalAttrs.version}";
    hash = "sha256-hs5yB0+eDlh/pNPaqYIU9C+RBpyrdPOAscQGIoqzmvU=";
  };

  build-system = [ setuptools ];

  dependencies = [ six ];

  pythonImportsCheck = [ "wsgi_intercept" ];

  meta = {
    description = "Module that acts as a WSGI application in place of a real URI for testing";
    homepage = "https://github.com/cdent/wsgi-intercept";
    license = lib.licenses.mit;
  };
})
