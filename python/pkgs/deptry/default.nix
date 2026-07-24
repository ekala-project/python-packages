{
  lib,
  buildPythonPackage,
  cargo,
  click,
  colorama,
  fetchFromGitHub,
  packaging,
  python,
  pytest-xdist,
  requirements-parser,
  rustc,
  rustPlatform,
  tomli,
}:

buildPythonPackage (finalAttrs: {
  pname = "deptry";
  version = "0.25.1";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "osprey-oss";
    repo = "deptry";
    tag = finalAttrs.version;
    hash = "sha256-GQWivQMWQ8wi6cWsCbmvSSyPEx1yl9QidO+9mTDrN1c=";
  };

  cargoDeps = rustPlatform.fetchCargoVendor {
    inherit (finalAttrs) pname version src;
    hash = "sha256-axUqKks3vxiJF2bRI/Qwk7iKjoUNQQc3NynI60n3quY=";
  };

  build-system = [
    cargo
    rustPlatform.cargoSetupHook
    rustPlatform.maturinBuildHook
    rustc
  ];

  dependencies = [
    click
    colorama
    packaging
    requirements-parser
    tomli
  ];
  pythonImportsCheck = [ "deptry" ];

  meta = {
    description = "Find unused, missing and transitive dependencies in a Python project";
    homepage = "https://github.com/osprey-oss/deptry";
    license = lib.licenses.mit;
    maintainers = [ ];
    mainProgram = "deptry";
  };
})
