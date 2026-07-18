{
  lib,
  buildPythonPackage,
  fetchPypi,
  setuptools,
  pycodestyle,
}:

buildPythonPackage rec {
  pname = "flake8-blind-except";
  version = "0.2.1";
  pyproject = true;

  src = fetchPypi {
    inherit pname version;
    hash = "sha256-8lpXWp3LPus8dgv5wi22C4taIxICJO0fqppD913X3RY=";
  };

  build-system = [ setuptools ];

  dependencies = [ pycodestyle ];

  pythonImportsCheck = [ "flake8_blind_except" ];

  meta = {
    description = "Flake8 extension that checks for blind except: statements";
    homepage = "https://github.com/elijahandrews/flake8-blind-except";
    license = lib.licenses.mit;
  };
}
