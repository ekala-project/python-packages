{
  lib,
  buildPythonPackage,
  fetchPypi,
  setuptools,
  six,
}:

buildPythonPackage rec {
  pname = "google-pasta";
  version = "0.2.0";
  pyproject = true;

  src = fetchPypi {
    inherit pname version;
    hash = "sha256-yfLI38j5bQ1YCCmZIHIb4wye7DfyOJ8okE9FRWXIoW4=";
  };

  build-system = [ setuptools ];

  dependencies = [ six ];

  pythonImportsCheck = [ "pasta" ];

  meta = {
    description = "AST-based Python refactoring library";
    homepage = "https://github.com/google/pasta";
    license = lib.licenses.asl20;
  };
}
