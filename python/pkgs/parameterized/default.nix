{
  lib,
  fetchPypi,
  buildPythonPackage,
  setuptools,
}:

buildPythonPackage rec {
  pname = "parameterized";
  version = "0.9.0";
  pyproject = true;

  src = fetchPypi {
    inherit pname version;
    hash = "sha256-f8kFJyzvpPNkwaNCnLvpwPmLeTmI77W/kKrIDwjbCbE=";
  };

  build-system = [ setuptools ];

  pythonImportsCheck = [ "parameterized" ];

  meta = {
    description = "Parameterized testing with any Python test framework";
    homepage = "https://github.com/wolever/parameterized";
    license = lib.licenses.bsd2;
  };
}
