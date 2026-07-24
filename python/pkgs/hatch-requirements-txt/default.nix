{
  lib,
  fetchPypi,
  buildPythonPackage,
  hatchling,
  packaging,
}:

buildPythonPackage rec {
  pname = "hatch-requirements-txt";
  version = "0.4.1";
  pyproject = true;

  src = fetchPypi {
    pname = "hatch_requirements_txt";
    inherit version;
    hash = "sha256-LGhuV1j9BbtV+n0MGY/dSB+NOqo8aTJg9cDXTONUfSA=";
  };

  build-system = [ hatchling ];

  dependencies = [
    hatchling
    packaging
  ];

  doCheck = false;

  pythonImportsCheck = [ "hatch_requirements_txt" ];

  meta = {
    description = "Hatchling plugin to read project dependencies from requirements.txt";
    homepage = "https://github.com/repo-helper/hatch-requirements-txt";
    license = lib.licenses.mit;
  };
}
