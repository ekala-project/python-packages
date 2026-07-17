{
  lib,
  fetchPypi,
  buildPythonPackage,
  setuptools-scm,
  more-itertools,
}:

buildPythonPackage rec {
  pname = "jaraco-stream";
  version = "3.0.4";
  pyproject = true;

  src = fetchPypi {
    pname = "jaraco_stream";
    inherit version;
    hash = "sha256-4rxQKOch7SzIUrluyaM/K3Zk6bLb+H7vvmF9EmZBk0s=";
  };

  pythonNamespaces = [ "jaraco" ];

  build-system = [ setuptools-scm ];

  dependencies = [ more-itertools ];

  pythonImportsCheck = [ "jaraco.stream" ];

  meta = {
    description = "Module with routines for handling streaming data";
    homepage = "https://github.com/jaraco/jaraco.stream";
    license = lib.licenses.mit;
  };
}
