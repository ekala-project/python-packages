{
  lib,
  buildPythonPackage,
  fetchPypi,

  # build-system
  flit-core,
}:

buildPythonPackage rec {
  pname = "scripttest";
  version = "3.0";
  pyproject = true;

  src = fetchPypi {
    inherit pname version;
    hash = "sha256-1A6IWdcbHUkY4dkYxme84FkoKG8svQnPt6bMHz8witA=";
  };

  build-system = [ flit-core ];

  pythonImportsCheck = [ "scripttest" ];

  meta = {
    description = "Library for testing interactive command-line applications";
    homepage = "https://pypi.org/project/scripttest/";
    license = lib.licenses.mit;
  };
}
