{ lib
, buildPythonPackage
, cargo
, fetchFromGitHub
, rustc
, rustPlatform
,
}:

buildPythonPackage (finalAttrs: {
  pname = "phonors";
  version = "0.3.0";
  pyproject = true;

  __structuredAttrs = true;

  src = fetchFromGitHub {
    owner = "phonopy";
    repo = "phonors";
    tag = "v${finalAttrs.version}";
    hash = "sha256-oQxOEjEJPSQcQsvjUrUnnsY7otW9VdkVe2RA/3H+K0g=";
  };

  cargoDeps = rustPlatform.fetchCargoVendor {
    inherit (finalAttrs) pname version src;
    hash = "sha256-XscNamcwVXauJo2KKde68bDyo2NTiO6wECTMreHk5aY=";
  };

  build-system = [
    cargo
    rustPlatform.cargoSetupHook
    rustPlatform.maturinBuildHook
    rustc
  ];

  # Module has no tests
  pythonImportsCheck = [ "phonors" ];

  meta = {
    description = "Python module implemented in Rust for Phonopy";
    homepage = "https://github.com/phonopy/phonors";
    license = lib.licenses.bsd3;
    maintainers = [ ];
  };
})
