{
  lib,
  buildPythonPackage,
  fetchPypi,

  # build-system
  setuptools,
}:

buildPythonPackage rec {
  pname = "dpath";
  version = "2.2.0";
  pyproject = true;

  src = fetchPypi {
    inherit pname version;
    hash = "sha256-NPfmMNxV6j8hnlVXJvXaS0sl8iADGcjmkCw5Qljdaj4=";
  };

  build-system = [ setuptools ];

  pythonImportsCheck = [ "dpath" ];

  meta = {
    description = "Python library for accessing and searching dictionaries via /slashed/paths";
    homepage = "https://github.com/akesterson/dpath-python";
    license = lib.licenses.mit;
  };
}
