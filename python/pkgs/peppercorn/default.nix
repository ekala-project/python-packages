{
  lib,
  buildPythonPackage,
  fetchPypi,

  # build-system
  setuptools,
}:

buildPythonPackage rec {
  pname = "peppercorn";
  version = "0.6";
  pyproject = true;

  src = fetchPypi {
    inherit pname version;
    hash = "sha256-ltdoHXoEVFz7ryxvtm3meynPxCQhqiY+THjyy7hb5MY=";
  };

  build-system = [ setuptools ];

  pythonImportsCheck = [ "peppercorn" ];

  meta = {
    description = "Library for converting a token stream into a data structure for use in web form posts";
    homepage = "https://docs.pylonsproject.org/projects/peppercorn/en/latest/";
    license = lib.licenses.bsd3;
  };
}
