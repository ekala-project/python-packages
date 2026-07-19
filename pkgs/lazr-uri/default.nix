{
  lib,
  fetchPypi,
  buildPythonPackage,
  setuptools,
}:

buildPythonPackage rec {
  pname = "lazr-uri";
  version = "1.0.8";
  pyproject = true;

  src = fetchPypi {
    pname = "lazr_uri";
    inherit version;
    hash = "sha256-DkWFTrImh5WN+4B2Vf9+CVsXZb5kniTMxYGTTQM307Q=";
  };

  build-system = [ setuptools ];

  dependencies = [ setuptools ];

  pythonNamespaces = [ "lazr" ];

  pythonImportsCheck = [ "lazr.uri" ];

  meta = {
    description = "Self-contained, easily reusable library for parsing, manipulating URIs";
    homepage = "https://launchpad.net/lazr.uri";
    license = lib.licenses.lgpl3Only;
  };
}
