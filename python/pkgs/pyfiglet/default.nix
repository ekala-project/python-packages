{
  lib,
  fetchPypi,
  buildPythonPackage,
  setuptools,
}:

buildPythonPackage rec {
  pname = "pyfiglet";
  version = "1.0.4";
  pyproject = true;

  src = fetchPypi {
    inherit pname version;
    hash = "sha256-25yZQO0b8wSN7/U07VL/La+7ws12ELF7teyh321CeO8=";
  };

  build-system = [ setuptools ];

  pythonImportsCheck = [ "pyfiglet" ];

  meta = {
    description = "FIGlet in pure Python";
    homepage = "https://github.com/pwaller/pyfiglet";
    license = lib.licenses.gpl2Plus;
  };
}
