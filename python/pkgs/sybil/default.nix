{
  lib,
  fetchPypi,
  buildPythonPackage,
  hatchling,
}:

buildPythonPackage rec {
  pname = "sybil";
  version = "10.1.0";
  pyproject = true;

  src = fetchPypi {
    inherit pname version;
    hash = "sha256-BiJJyIhqCrGeRdHDr9VjHsgG56lc9RU8llYPXkd1bL0=";
  };

  build-system = [ hatchling ];

  pythonImportsCheck = [ "sybil" ];

  meta = {
    description = "Document testing framework";
    homepage = "https://github.com/simplistix/sybil";
    license = lib.licenses.mit;
  };
}
