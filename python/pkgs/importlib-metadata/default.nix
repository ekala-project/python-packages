{
  lib,
  buildPythonPackage,
  fetchPypi,
  setuptools,
  setuptools-scm,
  toml,
  zipp,
}:

buildPythonPackage rec {
  pname = "importlib-metadata";
  version = "9.0.1";
  pyproject = true;

  src = fetchPypi {
    pname = "importlib_metadata";
    inherit version;
    hash = "sha256-q4MFgLwO89thzo+ucWOJ5UYrZ+AzAYurbY+A7xcXL5k=";
  };

  postPatch = ''
    sed -i "/coherent.licensed/d" pyproject.toml
  '';

  build-system = [
    setuptools # otherwise cross build fails
    setuptools-scm
  ];

  dependencies = [
    toml
    zipp
  ];

  # Cyclic dependencies due to pyflakefs
  doCheck = false;

  pythonImportsCheck = [ "importlib_metadata" ];
  meta = {
    description = "Read metadata from Python packages";
    homepage = "https://importlib-metadata.readthedocs.io/";
    license = lib.licenses.asl20;
  };
}
