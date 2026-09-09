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

buildPythonPackage rec {
  pname = "tldextract";
  version = "5.3.2";
  pyproject = true;

  src = fetchPypi {
    inherit pname version;
    hash = "sha256-wBdDG8CADy09G1fM424GZo8JMPYKbYxGFdTiuNopj6k=";
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
}
