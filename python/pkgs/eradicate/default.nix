{
  lib,
  buildPythonPackage,
  fetchPypi,
  setuptools,
}:

buildPythonPackage (finalAttrs: {
  pname = "eradicate";
  version = "3.0.1";
  pyproject = true;

  src = fetchPypi {
    inherit (finalAttrs) pname version;
    hash = "sha256-yct++OfoPD+9mAYBDiEImJK7ZJUxxoh1pVXHtcl4+qY=";
  };

  build-system = [ setuptools ];

  pythonImportsCheck = [ "eradicate" ];

  meta = {
    description = "Library to remove commented-out code from Python files";
    mainProgram = "eradicate";
    homepage = "https://github.com/myint/eradicate";
    license = lib.licenses.mit;
  };
})
