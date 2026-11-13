{
  lib,
  fetchPypi,
  buildPythonPackage,
  setuptools,
}:

buildPythonPackage (finalAttrs: {
  pname = "pytimeparse";
  version = "1.1.10";
  pyproject = true;

  src = fetchPypi {
    inherit (finalAttrs) pname version;
    hash = "sha256-7PDuYTpyywsdPVQEvTmKZCZldvw2zPMUkXivby7G9zY=";
  };

  build-system = [ setuptools ];

  pythonImportsCheck = [ "pytimeparse" ];

  meta = {
    description = "Library to parse various kinds of time expressions";
    homepage = "https://github.com/wroberts/pytimeparse";
    license = lib.licenses.mit;
  };
})
