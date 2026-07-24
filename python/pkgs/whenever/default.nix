{
  lib,
  stdenv,
  fetchFromGitHub,
  rustPlatform,
  cargo,
  rustc,
  libiconv,
  buildPythonPackage,
  setuptools,
  setuptools-rust,
  pytest-mypy-plugins,
  hypothesis,
  freezegun,
  time-machine,
  nix-update-script,
}:

buildPythonPackage rec {
  pname = "whenever";
  version = "0.10.2";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "ariebovenberg";
    repo = "whenever";
    tag = version;
    hash = "sha256-D3jNrxNTBbSheymnI72xAhdvvRzsbjIk+Gp82X7AkdU=";
  };

  cargoDeps = rustPlatform.fetchCargoVendor {
    inherit src;
    hash = "sha256-bmKUeVZwaqCN81v1YDnz66ZsUE8VTMBHlph6ZootKu8=";
  };

  build-system = [
    setuptools
    setuptools-rust
    rustPlatform.cargoSetupHook
    cargo
    rustc
  ];

  buildInputs = lib.optionals stdenv.hostPlatform.isDarwin [
    libiconv
  ];
  pythonImportsCheck = [ "whenever" ];

  # a bunch of failures, including an assumption of what the timezone on the host is
  # TODO: try enabling on bump
  doCheck = false;

  passthru.updateScript = nix-update-script { };

  meta = {
    description = "Strict, predictable, and typed datetimes";
    homepage = "https://github.com/ariebovenberg/whenever";
    license = lib.licenses.mit;
    maintainers = [ ];
  };
}
