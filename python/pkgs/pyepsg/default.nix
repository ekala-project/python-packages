{
  lib,
  fetchPypi,
  buildPythonPackage,
  setuptools,
  requests,
}:

buildPythonPackage rec {
  pname = "pyepsg";
  version = "0.4.0";
  pyproject = true;

  src = fetchPypi {
    inherit pname version;
    hash = "sha256-LQj60eeotHqQpOQ9pIW6lXBZI0Ja78Tio++lQNvUcNc=";
  };

  build-system = [ setuptools ];

  dependencies = [ requests ];

  pythonImportsCheck = [ "pyepsg" ];

  meta = {
    description = "Simple Python interface to epsg.io";
    homepage = "https://pyepsg.readthedocs.io/en/latest/";
    license = lib.licenses.lgpl3;
  };
}
