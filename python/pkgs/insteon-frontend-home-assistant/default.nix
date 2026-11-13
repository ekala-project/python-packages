{
  lib,
  buildPythonPackage,
  fetchPypi,
  setuptools,
}:

buildPythonPackage (finalAttrs: {
  pname = "insteon-frontend-home-assistant";
  version = "0.8.0";
  pyproject = true;

  src = fetchPypi {
    pname = "insteon_frontend_home_assistant";
    inherit (finalAttrs) version;
    hash = "sha256-HBkNkX61teEfzkWLVtwTVENitRbJ6uP30Q2FrjGZqjc=";
  };

  nativeBuildInputs = [ setuptools ];

  # upstream has no tests

  pythonImportsCheck = [ "insteon_frontend" ];

  meta = {
    description = "Insteon frontend for Home Assistant";
    homepage = "https://github.com/pyinsteon/insteon-panel";
    license = lib.licenses.mit;
  };
})
