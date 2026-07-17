{
  lib,
  fetchPypi,
  buildPythonPackage,
  setuptools,
}:

buildPythonPackage rec {
  pname = "setuptools-git";
  version = "1.2";
  pyproject = true;

  src = fetchPypi {
    inherit pname version;
    hash = "sha256-/2QTbaAaq7p2roiwUOcZeRjYshOcy/YUThTUcrnEBEU=";
  };

  build-system = [ setuptools ];

  pythonImportsCheck = [ "setuptools_git" ];

  doCheck = false;

  meta = {
    homepage = "https://github.com/msabramo/setuptools-git";
    description = "Setuptools revision control system plugin for Git";
    license = lib.licenses.bsd3;
  };
}
