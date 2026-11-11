{
  lib,
  buildPythonPackage,
  fetchFromGitHub,
  # build-system
  hatchling,
  # dependencies
  argcomplete,
  # optional-dependencies
  ipdb,
  pytestCheckHook,
}:

buildPythonPackage (finalAttrs: {
  pname = "cliche";
  version = "0.22.9";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "kootenpv";
    repo = "cliche";
    tag = "v${finalAttrs.version}";
    hash = "sha256-mA4pKPN63beGB3e4xleYKSzp4zAuOevx4O1O3ObHZA8=";
  };

  build-system = [ hatchling ];

  dependencies = [ argcomplete ];

  optional-dependencies.debug = [ ipdb ];

  nativeCheckInputs = [ pytestCheckHook ];

  pythonImportsCheck = [ "cliche" ];

  meta = {
    description = "Build a simple command-line interface from your functions :computer:";
    mainProgram = "cliche";
    homepage = "https://github.com/kootenpv/cliche";
    license = lib.licenses.mit;
  };
})
