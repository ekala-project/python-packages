{
  lib,
  buildPythonPackage,
  pythonAtLeast,
  fetchPypi,
  hatchling,
  hatch-nodejs-version,
  fastjsonschema,
  jsonschema,
  jupyter-core,
  traitlets,
  pep440,
  testpath,
}:

buildPythonPackage rec {
  pname = "nbformat";
  version = "5.11.1";
  pyproject = true;

  src = fetchPypi {
    inherit pname version;
    hash = "sha256-MtRSHGjG59WynHbe+u7Z9C6nMxQrmxn4gnfOEDkLnE0=";
  };

  build-system = [
    hatchling
    hatch-nodejs-version
  ];

  dependencies = [
    fastjsonschema
    jsonschema
    jupyter-core
    traitlets
  ];

  pythonImportsCheck = [ "nbformat" ];
  # Some of the tests use localhost networking.
  meta = {
    description = "Jupyter Notebook format";
    mainProgram = "jupyter-trust";
    homepage = "https://jupyter.org/";
    license = lib.licenses.bsd3;
    maintainers = [ ];
  };
}
