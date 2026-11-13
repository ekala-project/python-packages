{
  lib,
  buildPythonPackage,
  fetchPypi,
  setuptools,
}:

buildPythonPackage (finalAttrs: {
  pname = "types-setuptools";
  version = "84.2.0.20261104";
  pyproject = true;

  src = fetchPypi {
    pname = "types_setuptools";
    inherit (finalAttrs) version;
    hash = "sha256-HsdYu+3fiNUvlj/mY76rwhF7aq5zzz0pAtfdDfgb124=";
  };

  nativeBuildInputs = [ setuptools ];

  # Module doesn't have tests

  pythonImportsCheck = [ "setuptools-stubs" ];

  meta = {
    description = "Typing stubs for setuptools";
    homepage = "https://github.com/python/typeshed";
    license = lib.licenses.asl20;
  };
})
