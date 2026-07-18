{
  lib,
  buildPythonPackage,
  fetchPypi,

  # build-system
  setuptools,

  # dependencies
  six,
}:

buildPythonPackage rec {
  pname = "paver";
  version = "1.3.4";
  pyproject = true;

  src = fetchPypi {
    pname = "Paver";
    inherit version;
    hash = "sha256-0+ZJiIFIWrdQ7+QMUniYKpNDvGJ+E3sRrc7WJ3GTCMc=";
  };

  build-system = [ setuptools ];

  dependencies = [ six ];

  pythonImportsCheck = [ "paver" ];

  meta = {
    description = "Python-based build/distribution/deployment scripting tool";
    homepage = "https://github.com/paver/paver";
    license = lib.licenses.bsd3;
  };
}
