{
  lib,
  buildPythonPackage,
  fetchPypi,

  # build-system
  setuptools,
}:

buildPythonPackage rec {
  pname = "managesieve";
  version = "0.8.1";
  pyproject = true;

  src = fetchPypi {
    inherit pname version;
    hash = "sha256-LVwe0Pn6YPIAuoIaxXMfvCbOfS4NAjozkrdMNZDq+uU=";
  };

  build-system = [ setuptools ];

  pythonImportsCheck = [ "managesieve" ];

  meta = {
    homepage = "https://managesieve.readthedocs.io/";
    description = "ManageSieve client library for remotely managing Sieve scripts";
    license = lib.licenses.psfl;
  };
}
