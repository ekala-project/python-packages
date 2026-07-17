{
  lib,
  fetchPypi,
  buildPythonPackage,
  setuptools,
}:

buildPythonPackage rec {
  pname = "empy";
  version = "4.2.1";
  pyproject = true;

  src = fetchPypi {
    inherit pname version;
    hash = "sha256-uDHWQvypVQeCC1N3TAUYAxQrhEG4xCv4AAEdoGukJBs=";
  };

  nativeBuildInputs = [ setuptools ];

  pythonImportsCheck = [ "em" ];

  meta = {
    homepage = "http://www.alcyone.com/software/empy/";
    description = "Templating system for Python";
    license = lib.licenses.bsd3;
  };
}
