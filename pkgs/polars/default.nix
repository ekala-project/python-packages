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
  mimalloc,
  jemalloc,
  rust-jemalloc-sys,
  # Another alternative is to try `mimalloc`
  polarsMemoryAllocator ? mimalloc, # polarsJemalloc,
  polarsJemalloc ?
    let
      jemalloc' = rust-jemalloc-sys.override {
        jemalloc = jemalloc.override {
          # "libjemalloc.so.2: cannot allocate memory in static TLS block"

          # https://github.com/pola-rs/polars/issues/5401#issuecomment-1300998316
          disableInitExecTls = true;
        };
      };
    in
    assert builtins.elem "--disable-initial-exec-tls" jemalloc'.configureFlags;
    jemalloc',
}:

let
  version = "1.40.1";

  # Hide symbols to prevent accidental use
  rust-jemalloc-sys = throw "polars: use polarsMemoryAllocator over rust-jemalloc-sys";
  jemalloc = throw "polars: use polarsMemoryAllocator over jemalloc";
in

buildPythonPackage rec {
  pname = "polars";
  inherit version;
  pyproject = true;

  src = fetchFromGitHub {
    owner = "pola-rs";
    repo = "polars";
    tag = "py-${version}";
    hash = "sha256-QlrEYwoYPALELK3UGBC/92vCBIzFrigJAwU8qxn7Pys=";
  };

  cargoDeps = rustPlatform.fetchCargoVendor {
    inherit pname version src;
    hash = "sha256-rmCJ5SY5okvkgfd63yPDO2YOksqAWgKa9nqxTqP7Grw=";
  };

  requiredSystemFeatures = [ "big-parallel" ];

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
    polarsMemoryAllocator
    (pkgs.__splicedPackages.zstd or pkgs.zstd)
  ];

  env = {
    ZSTD_SYS_USE_PKG_CONFIG = true;

    # https://github.com/NixOS/nixpkgs/blob/5c38beb516f8da3a823d94b746dd3bf3c6b9bbd7/doc/languages-frameworks/rust.section.md#using-community-maintained-rust-toolchains-using-community-maintained-rust-toolchains
    # https://discourse.nixos.org/t/nixpkgs-rustplatform-and-nightly/22870
    RUSTC_BOOTSTRAP = true;

    RUSTFLAGS = lib.concatStringsSep " " (
      lib.optionals (polarsMemoryAllocator.pname == "mimalloc") [
        "--cfg allocator=\"mimalloc\""
      ]
    );
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
}
