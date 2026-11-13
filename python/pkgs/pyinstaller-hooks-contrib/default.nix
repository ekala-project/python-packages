{
  lib,
  buildPythonPackage,
  fetchPypi,
  setuptools,
}:

buildPythonPackage (finalAttrs: {
  pname = "pyinstaller-hooks-contrib";
  version = "2026.9";
  pyproject = true;

  src = fetchPypi {
    pname = "pyinstaller_hooks_contrib";
    inherit (finalAttrs) version;
    hash = "sha256-J0h2eQGstc7NEwRlK2x63Vv/z/HXHQEgf+JKXUKUKlY=";
  };

  build-system = [ setuptools ];

  pythonImportsCheck = [ "_pyinstaller_hooks_contrib" ];

  meta = {
    description = "Community maintained hooks for PyInstaller";
    homepage = "https://github.com/pyinstaller/pyinstaller-hooks-contrib";
    license = lib.licenses.asl20;
  };
})
