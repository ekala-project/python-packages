{
  lib,
  fetchPypi,
  buildPythonPackage,
  hatchling,
  packaging,
}:

buildPythonPackage rec {
  pname = "incremental";
  version = "24.11.0";
  pyproject = true;

  src = fetchPypi {
    inherit pname version;
    hash = "sha256-h9NIDbsIPB1zYiJRGozzgAEqgXbCRW0B70gyQqu7z4w=";
  };

  build-system = [ hatchling ];

  dependencies = [ packaging ];

  doCheck = false;

  pythonImportsCheck = [ "incremental" ];

  meta = {
    homepage = "https://github.com/twisted/incremental";
    description = "Small library that versions your Python projects";
    license = lib.licenses.mit;
  };
}
