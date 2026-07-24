{
  lib,
  buildPythonPackage,
  fetchPypi,
  hatchling,
  hatch-vcs,
}:

buildPythonPackage rec {
  pname = "pyhamcrest";
  version = "2.1.0";
  pyproject = true;

  src = fetchPypi {
    inherit pname version;
    hash = "sha256-xqy+wJI9DLfnLCKvGSbz58l7jo1p/HSY6rrK98l1vZw=";
  };

  build-system = [
    hatchling
    hatch-vcs
  ];

  pythonImportsCheck = [ "hamcrest" ];

  meta = {
    description = "Hamcrest framework for matcher objects";
    homepage = "https://github.com/hamcrest/PyHamcrest";
    license = lib.licenses.bsd3;
  };
}
