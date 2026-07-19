{
  lib,
  fetchPypi,
  buildPythonPackage,
  hatchling,
}:

buildPythonPackage rec {
  pname = "looseversion";
  version = "1.3.0";
  pyproject = true;

  src = fetchPypi {
    inherit pname version;
    hash = "sha256-695l8/a7lTGoEBbG/vPrlaYRga3Ee3+UnpwOpHkRZp4=";
  };

  build-system = [ hatchling ];

  pythonImportsCheck = [ "looseversion" ];

  meta = {
    description = "Version numbering for anarchists and software realists";
    homepage = "https://github.com/effigies/looseversion";
    license = lib.licenses.psfl;
  };
}
