{
  lib,
  buildPythonPackage,
  fetchPypi,
  poetry-core,
}:

buildPythonPackage rec {
  pname = "pfzy";
  version = "0.3.4";
  pyproject = true;

  src = fetchPypi {
    inherit pname version;
    hash = "sha256-cX6nZd0QtjYY5ymLLZjv2BngswzVkFyXByI9zuuUs/E=";
  };

  build-system = [ poetry-core ];

  pythonImportsCheck = [ "pfzy" ];

  meta = {
    description = "Python port of the fzy fuzzy string matching algorithm";
    homepage = "https://github.com/kazhala/pfzy";
    license = lib.licenses.mit;
  };
}
