{
  lib,
  fetchPypi,
  buildPythonPackage,
  hatchling,
}:

buildPythonPackage rec {
  pname = "dict2xml";
  version = "1.7.8";
  pyproject = true;

  src = fetchPypi {
    inherit pname version;
    hash = "sha256-ZjjamtMrD4voM20W4PNqnDghFF407T70iJgiqbmA+yg=";
  };

  build-system = [ hatchling ];

  pythonImportsCheck = [ "dict2xml" ];

  meta = {
    description = "Library to convert a Python dictionary into an XML string";
    homepage = "https://github.com/delfick/python-dict2xml";
    license = lib.licenses.mit;
  };
}
