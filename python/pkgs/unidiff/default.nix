{
  lib,
  buildPythonPackage,
  fetchPypi,
  setuptools,
}:

buildPythonPackage (finalAttrs: {
  pname = "unidiff";
  version = "1.0.0";
  pyproject = true;

  src = fetchPypi {
    inherit (finalAttrs) pname version;
    sha256 = "sha256-Xl1c+rLcmL6Bm3R0erfZ9a+GlTaeyHELk/mrDwrmpEk=";
  };

  build-system = [ setuptools ];

  pythonImportsCheck = [ "unidiff" ];

  meta = {
    description = "Unified diff python parsing/metadata extraction library";
    mainProgram = "unidiff";
    homepage = "https://github.com/matiasb/python-unidiff";
    license = lib.licenses.mit;
  };
})
