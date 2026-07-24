{
  lib,
  fetchPypi,
  buildPythonPackage,
  setuptools,
  six,
}:

buildPythonPackage rec {
  pname = "Twiggy";
  version = "0.5.1";
  pyproject = true;

  src = fetchPypi {
    inherit pname version;
    hash = "sha256-eTiEAnWXL2zomZSlvfsLhPA4YwGgQ6lgr2NklS54/+Q=";
  };

  build-system = [ setuptools ];

  dependencies = [ six ];

  pythonImportsCheck = [ "twiggy" ];

  meta = {
    description = "Twiggy is the first totally new design for a logger since log4j";
    homepage = "http://twiggy.wearpants.org";
    license = lib.licenses.bsd3;
  };
}
