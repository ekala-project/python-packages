{
  lib,
  buildPythonPackage,
  fetchPypi,
  setuptools,
}:

buildPythonPackage rec {
  pname = "pyinstaller-hooks-contrib";
  version = "2026.7";
  pyproject = true;

  src = fetchPypi {
    pname = "pyinstaller_hooks_contrib";
    inherit version;
    hash = "sha256-X7yqyyLE9KrIaaEn3OKD9npLTPzDfUlvJEZgPm1orvo=";
  };

  build-system = [ setuptools ];

  pythonImportsCheck = [ "_pyinstaller_hooks_contrib" ];

  meta = {
    description = "Community maintained hooks for PyInstaller";
    homepage = "https://github.com/pyinstaller/pyinstaller-hooks-contrib";
    license = lib.licenses.asl20;
  };
}
