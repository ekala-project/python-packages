{
  lib,
  buildPythonPackage,
  colorthief,
  fetchFromGitHub,
  nix-update-script,
  pillow,
  pytestCheckHook,
  rustPlatform,
}:

buildPythonPackage rec {
  pname = "modern-colorthief";
  version = "0.3.0";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "baseplate-admin";
    repo = "modern_colorthief";
    tag = version;
    hash = "sha256-oQ0ZAL8GyzKfFoSBJS2LIck2Z1IzZCYrkOc9nXfqyyg=";
  };

  cargoDeps = rustPlatform.fetchCargoVendor {
    inherit pname version src;
    hash = "sha256-csGUiJKAZn8OF3lxfw5VPwZxWDXHpFC0rczkD1+P8Sk=";
  };

  nativeBuildInputs = [
    rustPlatform.cargoSetupHook
    rustPlatform.maturinBuildHook
  ];

  optional-dependencies = {
    test = [
      colorthief
      pillow
    ];
  };

  nativeCheckInputs = [ pytestCheckHook ] ++ lib.concatAttrValues optional-dependencies;

  disabledTestPaths = [
    # Requires `fast_colorthief`, which isn't packaged
    "examples/test_time.py"
  ];

  pythonImportsCheck = [ "modern_colorthief" ];

  meta = {
    homepage = "https://modern-colorthief.readthedocs.io/";
    license = lib.licenses.mit;
    maintainers = [ ];
  };
}
