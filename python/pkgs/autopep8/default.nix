{
  lib,
  fetchPypi,
  buildPythonPackage,
  setuptools,
  pycodestyle,
}:

buildPythonPackage rec {
  pname = "autopep8";
  version = "2.3.2";
  pyproject = true;

  src = fetchPypi {
    inherit pname version;
    hash = "sha256-iUQKT5aRl7aamV5M4GYbAx9FWp93bSxbo9vYNGaTF1g=";
  };

  build-system = [ setuptools ];

  dependencies = [ pycodestyle ];

  doCheck = false;

  pythonImportsCheck = [ "autopep8" ];

  meta = {
    homepage = "https://github.com/hhatto/autopep8";
    description = "Tool that automatically formats Python code to conform to the PEP 8 style guide";
    license = lib.licenses.mit;
    mainProgram = "autopep8";
  };
}
