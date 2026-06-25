{
  lib,
  buildPythonPackage,
  fetchFromGitHub,
  pyparsing,
  setuptools,
}:

buildPythonPackage (finalAttrs: {
  pname = "httplib2";
  version = "0.31.1";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "httplib2";
    repo = "httplib2";
    tag = "v${finalAttrs.version}";
    hash = "sha256-1OO3BNtOGJxV9L34C60CHv95LLH9Ih1lY0zQUD4wrnc=";
  };

  build-system = [ setuptools ];

  dependencies = [ pyparsing ];

  pythonImportsCheck = [ "httplib2" ];

  meta = {
    description = "Comprehensive HTTP client library";
    homepage = "https://github.com/httplib2/httplib2";
    license = lib.licenses.mit;
  };
})
