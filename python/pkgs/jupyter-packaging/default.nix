{
  lib,
  buildPythonPackage,
  fetchPypi,
  fetchpatch,
  deprecation,
  hatchling,
  packaging,
  pytest-timeout,
  setuptools,
  tomlkit,
}:

buildPythonPackage rec {
  pname = "jupyter-packaging";
  version = "0.12.3";
  pyproject = true;

  src = fetchPypi {
    pname = "jupyter_packaging";
    inherit version;
    hash = "sha256-nZsrY7l//WeovFORwypCG8QVsmSjLJnk2NjdMdqunPQ=";
  };

  patches = [
    (fetchpatch {
      name = "setuptools-68-test-compatibility.patch";
      url = "https://github.com/jupyter/jupyter-packaging/commit/e963fb27aa3b58cd70c5ca61ebe68c222d803b7e.patch";
      hash = "sha256-NlO07wBCutAJ1DgoT+rQFkuC9Y+DyF1YFlTwWpwsJzo=";
    })
  ];

  build-system = [ hatchling ];

  dependencies = [
    deprecation
    packaging
    setuptools
    tomlkit
  ];
  pythonImportsCheck = [ "jupyter_packaging" ];

  meta = {
    description = "Jupyter Packaging Utilities";
    homepage = "https://github.com/jupyter/jupyter-packaging";
    license = lib.licenses.bsd3;
  };
}
