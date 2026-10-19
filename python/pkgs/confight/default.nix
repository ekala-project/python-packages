{
  lib,
  buildPythonPackage,
  fetchPypi,
  setuptools,
  toml,
}:

buildPythonPackage (finalAttrs: {
  pname = "confight";
  version = "2.0";
  pyproject = true;

  src = fetchPypi {
    inherit (finalAttrs) pname version;
    hash = "sha256-iodoexnh9tG4dgkjDXCUzWRFDhRlJ3HRgaNhxG2lwPY=";
  };

  nativeBuildInputs = [ setuptools ];

  dependencies = [ toml ];

  pythonImportsCheck = [ "confight" ];

  meta = {
    description = "Python context manager for managing pid files";
    mainProgram = "confight";
    homepage = "https://github.com/avature/confight";
    license = lib.licenses.mit;
  };
})
