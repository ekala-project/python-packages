{
  lib,
  fetchPypi,
  buildPythonPackage,
  setuptools,
}:

buildPythonPackage (finalAttrs: {
  pname = "mulpyplexer";
  version = "0.09";
  pyproject = true;

  src = fetchPypi {
    inherit (finalAttrs) pname version;
    hash = "sha256-FE6em/ZtOYj2BULJ09TJSFdDj3kI9g5T9MHLFiL7vTA=";
  };

  build-system = [ setuptools ];

  pythonImportsCheck = [ "mulpyplexer" ];

  meta = {
    description = "Multiplex interactions with lists of Python objects";
    homepage = "https://github.com/zardus/mulpyplexer";
    license = lib.licenses.bsd2;
  };
})
