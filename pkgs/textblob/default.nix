{
  lib,
  buildPythonPackage,
  fetchPypi,

  # build-system
  flit-core,

  # dependencies
  nltk,
}:

buildPythonPackage rec {
  pname = "textblob";
  version = "0.20.0";
  pyproject = true;

  src = fetchPypi {
    inherit pname version;
    hash = "sha256-rpvvOhbOy0quPplcyMb+mKnSpv/dWJkNzWjoF+jWa54=";
  };

  build-system = [ flit-core ];

  dependencies = [ nltk ];

  pythonImportsCheck = [ "textblob" ];

  meta = {
    description = "Simplified Text processing";
    homepage = "https://textblob.readthedocs.io/";
    license = lib.licenses.mit;
  };
}
