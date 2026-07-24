{
  lib,
  buildPythonPackage,
  fetchPypi,
  setuptools,
  six,
}:

buildPythonPackage rec {
  pname = "ppft";
  version = "1.7.8";
  pyproject = true;

  src = fetchPypi {
    inherit pname version;
    hash = "sha256-X2ltTzl66bCvObH6/7MZV8Ud+8WjgVhWRy1PTocpN+4=";
  };

  build-system = [ setuptools ];

  dependencies = [ six ];

  pythonImportsCheck = [ "ppft" ];

  meta = {
    description = "Distributed and parallel Python";
    homepage = "https://ppft.readthedocs.io/";
    license = lib.licenses.bsd3;
  };
}
