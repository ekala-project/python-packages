{
  lib,
  stdenv,
  build,
  buildPythonPackage,
  cargo,
  cmake,
  fetchFromGitHub,
  pkg-config,
  pkgs, # zstd hidden by python3Packages.zstd
  rustc,
  rustPlatform,
  setuptools,
}:

buildPythonPackage (finalAttrs: {
  pname = "polars";
  version = "1.40.1";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "pola-rs";
    repo = "polars";
    tag = "py-${finalAttrs.version}";
    hash = "sha256-QlrEYwoYPALELK3UGBC/92vCBIzFrigJAwU8qxn7Pys=";
  };

  cargoDeps = rustPlatform.fetchCargoVendor {
    inherit (finalAttrs) pname version src;
    hash = "sha256-rmCJ5SY5okvkgfd63yPDO2YOksqAWgKa9nqxTqP7Grw=";
  };

  requiredSystemFeatures = [ "big-parallel" ];

  # ethnum 1.5.2 builds TryFromIntError by transmuting `()`, which no longer
  # compiles now that TryFromIntError is not zero-sized. Build it safely.
  postPatch = ''
    substituteInPlace "$cargoDepsCopy"/source-registry-0/ethnum-1.5.2/src/error.rs \
      --replace-fail "pub const fn tfie()" "pub fn tfie()" \
      --replace-fail "unsafe { mem::transmute(()) }" "u8::try_from(-1i8).unwrap_err()"
  '';

  build-system = [
    setuptools
    build
  ];

  nativeBuildInputs = [
    cargo
    pkg-config
    cmake # libz-ng-sys
    rustPlatform.cargoSetupHook
    rustPlatform.cargoBuildHook
    rustPlatform.cargoInstallHook
    rustPlatform.maturinBuildHook
    rustc
  ];

  buildInputs = [
    (pkgs.__splicedPackages.zstd or pkgs.zstd)
  ];

  env = {
    ZSTD_SYS_USE_PKG_CONFIG = true;

    # https://github.com/NixOS/nixpkgs/blob/5c38beb516f8da3a823d94b746dd3bf3c6b9bbd7/doc/languages-frameworks/rust.section.md#using-community-maintained-rust-toolchains-using-community-maintained-rust-toolchains
    # https://discourse.nixos.org/t/nixpkgs-rustplatform-and-nightly/22870
    RUSTC_BOOTSTRAP = true;

    RUST_BACKTRACE = true;
  };

  dontUseCmakeConfigure = true;

  maturinBuildFlags = [
    "-m"
    "py-polars/runtime/polars-runtime-32/Cargo.toml"
  ];

  # maturin builds `_polars_runtime_32`, and we also need the pure-python `polars` wheel itself
  preBuild = ''
    pyproject-build --no-isolation --outdir dist/ --wheel py-polars
  '';

  # Fails on polars -> polars-runtime-32 dependency between the two wheels
  dontCheckRuntimeDeps = true;

  pythonImportsCheck = [
    "polars"
  ];

  meta = {
    description = "Dataframes powered by a multithreaded, vectorized query engine, written in Rust";
    homepage = "https://github.com/pola-rs/polars";
    license = lib.licenses.mit;
    mainProgram = "polars";
    platforms = lib.platforms.all;
  };
})
