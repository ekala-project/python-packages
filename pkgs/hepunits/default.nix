{
  lib,
  buildPythonPackage,
  fetchPypi,
  hatchling,
  hatch-vcs,
}:

buildPythonPackage rec {
  pname = "hepunits";
  version = "2.4.6";
  pyproject = true;

  src = fetchPypi {
    inherit pname version;
    hash = "sha256-vKatqTcUcWbWbp+hUlZvI3iGjXmCEcrWmQCAOZVg+jQ=";
  };

  build-system = [
    hatchling
    hatch-vcs
  ];

  pythonImportsCheck = [ "hepunits" ];

  meta = {
    description = "Units and constants in the HEP system of units";
    homepage = "https://github.com/scikit-hep/hepunits";
    license = lib.licenses.bsd3;
  };
}
