{
  lib,
  buildPythonPackage,
  fetchPypi,

  # build-system
  setuptools,
  flit-core,
}:

buildPythonPackage rec {
  pname = "tinytag";
  version = "2.2.1";
  pyproject = true;

  src = fetchPypi {
    inherit pname version;
    hash = "sha256-5tBmEOvnzWb9B74tO5SVkUqzJlSl5HZXu4zUTCSEUjw=";
  };

  build-system = [
    setuptools
    flit-core
  ];

  pythonImportsCheck = [ "tinytag" ];

  meta = {
    description = "Read audio file metadata";
    homepage = "https://github.com/tinytag/tinytag";
    license = lib.licenses.mit;
  };
}
