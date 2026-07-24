{
  lib,
  buildPythonPackage,
  fetchPypi,
  setuptools,
}:

buildPythonPackage (finalAttrs: {
  pname = "unidiff";
  version = "0.7.5";
  pyproject = true;

  src = fetchPypi {
    inherit (finalAttrs) pname version;
    sha256 = "2e5f0162052248946b9f0970a40e9e124236bf86c82b70821143a6fc1dea2574";
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
