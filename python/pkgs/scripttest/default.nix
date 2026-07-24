{
  lib,
  buildPythonPackage,
  fetchPypi,

  # build-system
  setuptools,
}:

buildPythonPackage rec {
  pname = "scripttest";
  version = "2.0.post1";
  pyproject = true;

  src = fetchPypi {
    inherit pname version;
    hash = "sha256-pgZ/H+rfSy7T5ZSwsy5BWJZA5/o5dHZapj1QhSDAv9w=";
  };

  build-system = [ setuptools ];

  pythonImportsCheck = [ "scripttest" ];

  meta = {
    description = "Library for testing interactive command-line applications";
    homepage = "https://pypi.org/project/scripttest/";
    license = lib.licenses.mit;
  };
}
