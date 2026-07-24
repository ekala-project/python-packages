{
  lib,
  buildPythonPackage,
  fetchPypi,

  # build-system
  setuptools,
}:

buildPythonPackage rec {
  pname = "hupper";
  version = "1.12.1";
  pyproject = true;

  src = fetchPypi {
    inherit pname version;
    hash = "sha256-Br9UFw/07PTIStXxiN7jkBFzq0ScJgitBbm/1rE+Mus=";
  };

  build-system = [ setuptools ];

  pythonImportsCheck = [ "hupper" ];

  meta = {
    description = "In-process file monitor/reloader for reloading your code automatically during development";
    homepage = "https://github.com/Pylons/hupper";
    license = lib.licenses.mit;
  };
}
