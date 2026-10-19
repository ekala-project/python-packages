{
  lib,
  buildPythonPackage,
  fetchPypi,
  # build-system
  setuptools,
  beniget,
  frilouz,
  gast,
  nbconvert,
  nbformat,
  pyyaml,
}:

buildPythonPackage (finalAttrs: {
  pname = "memestra";
  version = "0.2.1";
  pyproject = true;

  src = fetchPypi {
    inherit (finalAttrs) pname version;
    hash = "sha256-6shwf9BoDfZMy0itP8esNP4ov6fw6LJpO3Y5ZahwDZw=";
  };

  build-system = [ setuptools ];

  dependencies = [
    gast
    beniget
    frilouz
    nbconvert
    nbformat
    pyyaml
  ];

  # Tests are not detected and so the checkPhase fails

  pythonImportsCheck = [ "memestra" ];

  meta = {
    description = "Linter that tracks reference to deprecated functions";
    homepage = "https://github.com/QuantStack/memestra";
    license = lib.licenses.bsd3;
  };
})
