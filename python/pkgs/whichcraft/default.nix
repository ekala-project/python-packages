{
  lib,
  buildPythonPackage,
  fetchPypi,
  setuptools,
}:

buildPythonPackage rec {
  pname = "whichcraft";
  version = "0.6.1";
  pyproject = true;

  src = fetchPypi {
    inherit pname version;
    hash = "sha256-rNu5G2PWoV771kMNHXstNuRKcWl+k+Gbfe1Hev2fzoc=";
  };

  build-system = [ setuptools ];

  pythonImportsCheck = [ "whichcraft" ];

  meta = {
    description = "Cross-platform cross-python shutil.which functionality";
    homepage = "https://github.com/pydanny/whichcraft";
    license = lib.licenses.bsd3;
  };
}
