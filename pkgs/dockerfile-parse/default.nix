{
  lib,
  buildPythonPackage,
  fetchPypi,
  setuptools,
}:

buildPythonPackage rec {
  pname = "dockerfile-parse";
  version = "2.0.1";
  pyproject = true;

  src = fetchPypi {
    inherit pname version;
    hash = "sha256-MYTM3FEyIZg+UDrADhqlBKKqj4Tl3mc8RrC27umex7w=";
  };

  build-system = [ setuptools ];

  pythonImportsCheck = [ "dockerfile_parse" ];

  meta = {
    description = "Library for parsing Dockerfile files";
    homepage = "https://github.com/DBuildService/dockerfile-parse";
    license = lib.licenses.bsd3;
  };
}
