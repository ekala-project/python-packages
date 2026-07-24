{
  lib,
  fetchPypi,
  buildPythonPackage,
  setuptools,
  rply,
}:

buildPythonPackage rec {
  pname = "rnc2rng";
  version = "2.7.0";
  pyproject = true;

  src = fetchPypi {
    inherit pname version;
    hash = "sha256-3Z/7vWnQnLB+bnqM+A/ShwP9xtO5Am+HVrScvjMUZ2s=";
  };

  build-system = [ setuptools ];

  dependencies = [ rply ];

  pythonImportsCheck = [ "rnc2rng" ];

  meta = {
    description = "Compact to regular syntax conversion library for RELAX NG schemata";
    homepage = "https://github.com/djc/rnc2rng";
    license = lib.licenses.mit;
    mainProgram = "rnc2rng";
  };
}
