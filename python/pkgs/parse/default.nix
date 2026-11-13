{
  lib,
  fetchPypi,
  buildPythonPackage,
  setuptools,
}:

buildPythonPackage (finalAttrs: {
  pname = "parse";
  version = "1.22.4";
  pyproject = true;

  src = fetchPypi {
    inherit (finalAttrs) pname version;
    hash = "sha256-cG1Fj+7VqBsCdo0xVugHC69s7n0VCjo8DNQxAah1w7U=";
  };

  build-system = [ setuptools ];

  pythonImportsCheck = [ "parse" ];

  meta = {
    homepage = "https://github.com/r1chardj0n3s/parse";
    description = "parse() is the opposite of format()";
    license = lib.licenses.bsdOriginal;
  };
})
