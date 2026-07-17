{
  lib,
  fetchPypi,
  buildPythonPackage,
  setuptools,
}:

buildPythonPackage rec {
  pname = "construct";
  version = "2.10.70";
  pyproject = true;

  src = fetchPypi {
    inherit pname version;
    hash = "sha256-TSRy+WhHMeWMycVsRjvmO6oUR9Z04NZq61Ynsi9RLCk=";
  };

  build-system = [ setuptools ];

  pythonImportsCheck = [ "construct" ];

  meta = {
    homepage = "https://construct.readthedocs.org/";
    description = "Powerful declarative parser (and builder) for binary data";
    license = lib.licenses.mit;
  };
}
