{
  lib,
  buildPythonPackage,
  fetchFromGitHub,
  # build-system
  setuptools,
  pytestCheckHook,
}:

buildPythonPackage (finalAttrs: {
  pname = "ndspy";
  version = "4.2.0";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "RoadrunnerWMC";
    repo = "ndspy";
    tag = "v${finalAttrs.version}";
    hash = "sha256-PQONVEuh5Fg2LHr4gq0XTGcOpps/s9FSgoyDn4BCcik=";
  };

  build-system = [ setuptools ];

  nativeCheckInputs = [ pytestCheckHook ];

  pythonImportsCheck = [ "ndspy" ];

  preCheck = ''
    cd tests
  '';

  meta = {
    description = "Python library for many Nintendo DS file formats";
    homepage = "https://github.com/RoadrunnerWMC/ndspy";
    license = lib.licenses.gpl3Plus;
  };
})
