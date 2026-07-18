{
  lib,
  fetchPypi,
  buildPythonPackage,
  setuptools,
}:

buildPythonPackage rec {
  pname = "plotext";
  version = "5.3.2";
  pyproject = true;

  src = fetchPypi {
    inherit pname version;
    hash = "sha256-UtHpMuZ8F3vzV6Pw/mzhTRqW9/fVZ517RVuSnfUXBo4=";
  };

  build-system = [ setuptools ];

  pythonImportsCheck = [ "plotext" ];

  meta = {
    description = "Plotting directly in the terminal";
    mainProgram = "plotext";
    homepage = "https://github.com/piccolomo/plotext";
    license = lib.licenses.mit;
  };
}
