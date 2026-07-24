{
  lib,
  buildPythonPackage,
  fetchPypi,
  setuptools,
}:

buildPythonPackage rec {
  pname = "addict";
  version = "2.4.0";
  pyproject = true;

  src = fetchPypi {
    inherit pname version;
    hash = "sha256-s7IhDg4GeigfVkbIxduS6ZtyMeqLDrX3Tb354lnU5JQ=";
  };

  build-system = [ setuptools ];

  pythonImportsCheck = [ "addict" ];

  meta = {
    description = "Module that exposes a dictionary subclass that allows items to be set like attributes";
    homepage = "https://github.com/mewwts/addict";
    license = lib.licenses.mit;
  };
}
