{
  lib,
  buildPythonPackage,
  fetchPypi,
  hatchling,
  hatch-vcs,
  packaging,
  pytz,
  sentinels,
}:

buildPythonPackage rec {
  pname = "mongomock";
  version = "4.3.0";
  pyproject = true;

  src = fetchPypi {
    inherit pname version;
    hash = "sha256-MmZ7eQZvq8EtTxfxao/XNhtfRDUgizujLCJuUiEqjDA=";
  };

  build-system = [
    hatchling
    hatch-vcs
  ];

  dependencies = [
    packaging
    pytz
    sentinels
  ];

  pythonImportsCheck = [ "mongomock" ];

  meta = {
    description = "Fake pymongo stub for testing simple MongoDB-dependent code";
    homepage = "https://github.com/mongomock/mongomock";
    license = lib.licenses.bsd3;
  };
}
