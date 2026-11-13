{
  lib,
  buildPythonPackage,
  cffi,
  fetchPypi,
  setuptools,
  yajl,
}:

buildPythonPackage (finalAttrs: {
  pname = "ijson";
  version = "3.6.0";
  pyproject = true;

  src = fetchPypi {
    inherit (finalAttrs) pname version;
    hash = "sha256-7I+SZVJOckkF7PAL3QYcN0uqqNUEXvUEJWlfsG77RfU=";
  };

  build-system = [ setuptools ];

  buildInputs = [ yajl ];

  dependencies = [ cffi ];

  pythonImportsCheck = [ "ijson" ];

  meta = {
    description = "Iterative JSON parser with a standard Python iterator interface";
    homepage = "https://github.com/ICRAR/ijson";
    license = lib.licenses.bsd3;
  };
})
