{
  lib,
  buildPythonPackage,
  fetchPypi,
  setuptools,
  setuptools-scm,
  requests,
}:

buildPythonPackage rec {
  pname = "pysolr";
  version = "3.11.0";
  pyproject = true;

  src = fetchPypi {
    inherit pname version;
    hash = "sha256-u9DnRng1MWiA+ZS1U4bJvDwUZzPBfYWj/tMXdVl2xAo=";
  };

  build-system = [
    setuptools
    setuptools-scm
  ];

  dependencies = [ requests ];

  pythonImportsCheck = [ "pysolr" ];

  meta = {
    description = "Lightweight Python wrapper for Apache Solr";
    homepage = "https://github.com/toastdriven/pysolr/";
    license = lib.licenses.bsd3;
  };
}
