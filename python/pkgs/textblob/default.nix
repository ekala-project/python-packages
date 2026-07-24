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
  version = "0.20.1";
  pyproject = true;

  src = fetchPypi {
    inherit pname version;
    hash = "sha256-+9GjMHUy6d3bj1AoSHRVngECDnm1/lrkwdpwmp4gh+o=";
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
