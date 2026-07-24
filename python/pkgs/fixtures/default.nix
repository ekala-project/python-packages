{
  lib,
  buildPythonPackage,
  fetchPypi,

  # build-system
  hatchling,
  hatch-vcs,
}:

buildPythonPackage rec {
  pname = "fixtures";
  version = "4.3.2";
  pyproject = true;

  src = fetchPypi {
    inherit pname version;
    hash = "sha256-t9tkAUcyUT8j0SsMSa5Se6DAwfJmfsl9kTbWcVfrzl0=";
  };

  build-system = [
    hatchling
    hatch-vcs
  ];

  pythonRemoveDeps = [ "testtools" ];

  pythonImportsCheck = [ "fixtures" ];

  meta = {
    description = "Reusable state for writing clean tests and more";
    homepage = "https://github.com/testing-cabal/fixtures";
    license = lib.licenses.asl20;
  };
}
