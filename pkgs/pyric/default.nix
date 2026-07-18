{
  lib,
  buildPythonPackage,
  fetchPypi,

  # build-system
  setuptools,
}:

buildPythonPackage rec {
  pname = "pyric";
  version = "0.1.6.3";
  pyproject = true;

  src = fetchPypi {
    pname = "PyRIC";
    inherit version;
    hash = "sha256-tTmwHK/r0kBsAAl/lFJeoPjs0d2S93MfQ+rA7xbCzMk=";
  };

  build-system = [ setuptools ];

  pythonImportsCheck = [ "pyric" ];

  meta = {
    description = "Python Radio Interface Controller";
    homepage = "https://github.com/wraith-wireless/PyRIC";
    license = lib.licenses.gpl3Plus;
  };
}
