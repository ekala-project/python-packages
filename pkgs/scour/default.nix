{
  lib,
  buildPythonPackage,
  fetchPypi,
  setuptools,
  six,
}:

buildPythonPackage rec {
  pname = "scour";
  version = "0.38.2";
  pyproject = true;

  src = fetchPypi {
    inherit pname version;
    hash = "sha256-aIHsJmYMEwxezZlqxvawOTndV0GY9Qdz8lCLgaaODa8=";
  };

  build-system = [ setuptools ];

  dependencies = [ six ];

  pythonImportsCheck = [ "scour" ];

  meta = {
    description = "SVG Optimizer / Cleaner";
    mainProgram = "scour";
    homepage = "https://github.com/scour-project/scour";
    license = lib.licenses.asl20;
  };
}
