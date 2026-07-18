{
  lib,
  buildPythonPackage,
  fetchPypi,

  # build-system
  setuptools,
}:

buildPythonPackage rec {
  pname = "parsley";
  version = "1.3";
  pyproject = true;

  src = fetchPypi {
    pname = "Parsley";
    inherit version;
    hash = "sha256-lEQnjUcWHV8r52p2eAmjy+bbTbgi9GpP10gdQFcgjUE=";
  };

  build-system = [ setuptools ];

  pythonImportsCheck = [ "parsley" ];

  meta = {
    description = "Parser generator library based on OMeta";
    homepage = "https://launchpad.net/parsley";
    license = lib.licenses.mit;
  };
}
