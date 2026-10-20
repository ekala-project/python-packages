{
  lib,
  buildPythonPackage,
  fetchPypi,
  legacy-cgi,
  setuptools,
}:

buildPythonPackage (finalAttrs: {
  pname = "htmlmin";
  version = "0.1.12";
  pyproject = true;

  src = fetchPypi {
    inherit (finalAttrs) pname version;
    hash = "sha256-UMHvRjA3Sl1yOQAJapYc/0Jt/0a0jzTRlKgbvhTsoXg=";
  };

  build-system = [
    setuptools
  ];

  dependencies = [ legacy-cgi ];

  # pypi tarball does not contain tests

  meta = {
    description = "Configurable HTML Minifier with safety features";
    mainProgram = "htmlmin";
    homepage = "https://github.com/mankyd/htmlmin";
    license = lib.licenses.bsd3;
  };
})
