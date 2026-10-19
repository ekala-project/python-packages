{
  lib,
  buildPythonPackage,
  fetchPypi,
  # build-system
  setuptools,
  lxml,
  requests,
}:

buildPythonPackage rec {
  pname = "ebaysdk";
  version = "2.2.0";
  pyproject = true;

  src = fetchPypi {
    inherit pname version;
    hash = "sha256-Lrh11wa0gfWcqN0wdFON9+UZaBT5zhLQ74RpA0Opx/M=";
  };

  build-system = [ setuptools ];

  dependencies = [
    lxml
    requests
  ];

  # requires network

  meta = {
    description = "eBay SDK for Python";
    homepage = "https://github.com/timotheus/ebaysdk-python";
    license = lib.licenses.cddl;
  };
}
