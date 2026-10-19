{
  lib,
  buildPythonPackage,
  fetchFromGitHub,
  setuptools,
  legacy-cgi,
}:

buildPythonPackage (finalAttrs: {
  pname = "webob";
  version = "1.8.9";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "Pylons";
    repo = "webob";
    tag = finalAttrs.version;
    hash = "sha256-axJQwlybuqBS6RgI2z9pbw58vHF9aC9AxCg13CIKCLs=";
  };

  build-system = [ setuptools ];

  # https://github.com/Pylons/webob/issues/437
  dependencies = [ legacy-cgi ];

  pythonImportsCheck = [ "webob" ];

  meta = {
    description = "WSGI request and response object";
    homepage = "https://webob.org/";
    license = lib.licenses.mit;
  };
})
