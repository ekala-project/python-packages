{
  lib,
  stdenv,
  buildPythonPackage,
  fetchPypi,
  semantic-version,
  setuptools,
  setuptools-scm,
  replaceVars,
  python,
  targetPackages,
}:

buildPythonPackage rec {
  pname = "setuptools-rust";
  version = "1.13.0";
  pyproject = true;

  src = fetchPypi {
    pname = "setuptools_rust";
    inherit version;
    hash = "sha256-8q/PS67uaJkQzknPqKrU4IzOcvQXRJvMMokbhmT9xyY=";
  };

  build-system = [
    setuptools
    setuptools-scm
  ];

  dependencies = [
    semantic-version
    setuptools
  ];

  pythonImportsCheck = [ "setuptools_rust" ];

  doCheck = false;

  setupHook =
    let
      pythonOnTarget = python.pythonOnTargetForTarget or { };
    in
    if pythonOnTarget == { } then
      null
    else
      replaceVars ./setuptools-rust-hook.sh {
        pyLibDir = "${pythonOnTarget}/lib/${pythonOnTarget.libPrefix}";
        cargoBuildTarget = stdenv.targetPlatform.rust.rustcTargetSpec;
        cargoLinkerVar = stdenv.targetPlatform.rust.cargoEnvVarTarget;
        targetLinker = "${targetPackages.stdenv.cc}/bin/${targetPackages.stdenv.cc.targetPrefix}cc";
      };

  meta = {
    description = "Setuptools plugin for Rust support";
    homepage = "https://github.com/PyO3/setuptools-rust";
    license = lib.licenses.mit;
    maintainers = [ ];
  };
}
