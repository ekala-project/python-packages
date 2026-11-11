{
  lib,
  buildPythonPackage,
  fetchPypi,
  setuptools,
}:

buildPythonPackage (finalAttrs: {
  pname = "unidiff";
  version = "1.0.1";
  pyproject = true;

  src = fetchPypi {
    inherit (finalAttrs) pname version;
    sha256 = "sha256-2UJbxRY5DFR0OhBFssHJfwLSRakTokHdSZ+Vitst+Zg=";
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
