{
  lib,
  buildPythonPackage,
  fetchPypi,
  setuptools,
}:

buildPythonPackage (finalAttrs: {
  pname = "xxhash";
  version = "4.1.0";
  pyproject = true;

  src = fetchPypi {
    inherit (finalAttrs) pname version;
    hash = "sha256-ybKI5MH12uVEF7yKBeb22vUFeD2Ra0eD9N0vLn1dtIY=";
  };

  nativeBuildInputs = [ setuptools ];

  pythonImportsCheck = [ "xxhash" ];

  meta = {
    description = "Python Binding for xxHash";
    homepage = "https://github.com/ifduyue/python-xxhash";
    license = lib.licenses.bsd2;
  };
})
