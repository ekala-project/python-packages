{
  lib,
  buildPythonPackage,
  fetchPypi,
  setuptools,
}:

buildPythonPackage (finalAttrs: {
  pname = "dyn";
  version = "1.8.6";
  pyproject = true;

  src = fetchPypi {
    inherit (finalAttrs) pname version;
    hash = "sha256-933etYrKRgSqJfOMIuIDL4Uv4/RdSEFMNWFtW5qiPpA=";
  };

  build-system = [ setuptools ];

  # Module has no tests

  pythonImportsCheck = [ "dyn" ];

  meta = {
    description = "Dynect dns lib";
    homepage = "https://dyn.readthedocs.org";
    license = lib.licenses.bsd3;
  };
})
