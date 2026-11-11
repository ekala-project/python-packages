{
  lib,
  fetchPypi,
  buildPythonPackage,
  setuptools,
}:

buildPythonPackage (finalAttrs: {
  pname = "bitarray";
  version = "3.12.3";
  pyproject = true;

  src = fetchPypi {
    inherit (finalAttrs) pname version;
    hash = "sha256-kZ41qVHApVFjG5S/Vo8/XjjQBODGCGbLLKUb2MR3j+w=";
  };

  build-system = [ setuptools ];

  pythonImportsCheck = [ "bitarray" ];

  meta = {
    description = "Efficient arrays of booleans";
    homepage = "https://github.com/ilanschnell/bitarray";
    changelog = "https://github.com/ilanschnell/bitarray/raw/${finalAttrs.version}/CHANGE_LOG";
    license = lib.licenses.psfl;
  };
})
