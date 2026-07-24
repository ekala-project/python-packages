{
  lib,
  buildPythonPackage,
  fetchPypi,

  # build-system
  setuptools,
  setuptools-scm,

  # dependencies
  redis,
}:

buildPythonPackage rec {
  pname = "portalocker";
  version = "3.2.0";
  pyproject = true;

  src = fetchPypi {
    inherit pname version;
    hash = "sha256-HzAClWpUqMNzBYbFx3vxj65BSeB+rxwp/D+vTVo/iaw=";
  };

  nativeBuildInputs = [
    setuptools
    setuptools-scm
  ];

  propagatedBuildInputs = [ redis ];

  pythonImportsCheck = [ "portalocker" ];

  meta = {
    description = "Library to provide an easy API to file locking";
    homepage = "https://github.com/WoLpH/portalocker";
    license = lib.licenses.psfl;
  };
}
