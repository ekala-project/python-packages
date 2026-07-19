{
  lib,
  buildPythonPackage,
  fetchPypi,
  setuptools,
  bottle,
}:

buildPythonPackage rec {
  pname = "pympler";
  version = "1.1";
  pyproject = true;

  src = fetchPypi {
    inherit pname version;
    hash = "sha256-HqqGfLiZLCGEMPFwj9rM2lPfBkFE0cVlax5vHuYABCQ=";
  };

  build-system = [ setuptools ];

  dependencies = [ bottle ];

  pythonImportsCheck = [ "pympler" ];

  meta = {
    description = "Tool to measure, monitor and analyze memory behavior";
    homepage = "https://github.com/pympler/pympler";
    license = lib.licenses.asl20;
  };
}
