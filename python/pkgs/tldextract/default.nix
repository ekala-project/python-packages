{
  lib,
  buildPythonPackage,
  fetchPypi,

  # build-system
  setuptools,
  setuptools-scm,

  # dependencies
  requests,
  requests-file,
  idna,
  filelock,
}:

buildPythonPackage (finalAttrs: {
  pname = "tldextract";
  version = "5.4.0";
  pyproject = true;

  src = fetchPypi {
    inherit (finalAttrs) pname version;
    hash = "sha256-bJIjISwVwlwNor9zE4k8FPF1yza2SgxC2mekaODGHuM=";
  };

  build-system = [
    setuptools
    setuptools-scm
  ];

  dependencies = [
    requests
    requests-file
    idna
    filelock
  ];

  pythonImportsCheck = [ "tldextract" ];

  meta = {
    description = "Python module to accurately separate the TLD from the domain of an URL";
    homepage = "https://github.com/john-kurkowski/tldextract";
    license = lib.licenses.bsd3;
  };
})
