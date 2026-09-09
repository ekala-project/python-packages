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
  version = "2.3.2";
  pyproject = true;

  src = fetchPypi {
    inherit pname version;
    hash = "sha256-Ah1xHNvb+EDTtnuXbLNNrcWNL8/UkOt075YCs3uZFBQ=";
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
