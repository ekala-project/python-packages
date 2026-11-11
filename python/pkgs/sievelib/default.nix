{
  lib,
  buildPythonPackage,
  fetchPypi,

  # build-system
  setuptools-scm,

  # dependencies
  typing-extensions,
}:

buildPythonPackage (finalAttrs: {
  pname = "sievelib";
  version = "1.6.0";
  pyproject = true;

  src = fetchPypi {
    inherit (finalAttrs) pname version;
    hash = "sha256-VcEa0/QEqsX/D07J4K41Th2AOu1yxEUkWY0l3qyGsLg=";
  };

  build-system = [ setuptools-scm ];

  dependencies = [ typing-extensions ];

  pythonImportsCheck = [ "sievelib" ];

  meta = {
    description = "Client-side Sieve and Managesieve library";
    homepage = "https://github.com/tonioo/sievelib";
    license = lib.licenses.mit;
  };
})
