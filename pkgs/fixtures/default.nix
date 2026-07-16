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
  version = "4.2.8";
  pyproject = true;

  src = fetchPypi {
    inherit pname version;
    hash = "sha256-6hRlZKZmYQbEgffDX5ek1lSFyEsMyGpQdZcWS2zA2Ek=";
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
