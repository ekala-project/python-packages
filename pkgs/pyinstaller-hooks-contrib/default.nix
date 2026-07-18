{
  lib,
  buildPythonPackage,
  fetchPypi,
  setuptools,
}:

buildPythonPackage rec {
  pname = "pyinstaller-hooks-contrib";
  version = "2026.1";
  pyproject = true;

  src = fetchPypi {
    pname = "pyinstaller_hooks_contrib";
    inherit version;
    hash = "sha256-pfCJGh6B6SQGq5F9nnat/XoraEFe4uNclQp7ORC8Nhs=";
  };

  build-system = [ setuptools ];

  pythonImportsCheck = [ "_pyinstaller_hooks_contrib" ];

  meta = {
    description = "Community maintained hooks for PyInstaller";
    homepage = "https://github.com/pyinstaller/pyinstaller-hooks-contrib";
    license = lib.licenses.asl20;
  };
}
