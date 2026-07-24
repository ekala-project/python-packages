{
  lib,
  fetchPypi,
  buildPythonPackage,
  setuptools,
}:

buildPythonPackage rec {
  pname = "pycosat";
  version = "0.6.3";
  pyproject = true;

  src = fetchPypi {
    inherit pname version;
    extension = "zip";
    hash = "sha256-TJmHSUan6Tm7lBu7AZ3Swg5gaOMQfJE2bnd5xp1w4O0=";
  };

  build-system = [ setuptools ];

  pythonImportsCheck = [ "pycosat" ];

  meta = {
    description = "Bindings to picosat SAT solver";
    homepage = "https://github.com/ContinuumIO/pycosat";
    license = lib.licenses.mit;
  };
}
