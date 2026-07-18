{
  lib,
  fetchPypi,
  buildPythonPackage,
  setuptools,
}:

buildPythonPackage rec {
  pname = "poyo";
  version = "0.5.0";
  pyproject = true;

  src = fetchPypi {
    inherit pname version;
    hash = "sha256-4mlWqngMRfARypiG8ERZDi2P2LYdt7HBz04IafSO1N0=";
  };

  build-system = [ setuptools ];

  pythonImportsCheck = [ "poyo" ];

  meta = {
    homepage = "https://github.com/hackebrot/poyo";
    description = "Lightweight YAML Parser for Python";
    license = lib.licenses.mit;
  };
}
