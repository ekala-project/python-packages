{
  lib,
  pkgs,
  buildPythonPackage,
  fetchFromGitHub,
  rustPlatform,

  # nativeBuildInputs
  pkg-config,

  # tests
  mktestdocs,
}:

buildPythonPackage (finalAttrs: {
  pname = "tantivy";
  version = "0.26.0";
  pyproject = true;
  __structuredAttrs = true;

  src = fetchFromGitHub {
    owner = "quickwit-oss";
    repo = "tantivy-py";
    tag = finalAttrs.version;
    hash = "sha256-VmymAxkGPFwqmsy5Y9d1/vBGUUU3xeSEteJLQIMt0FY=";
  };

  cargoDeps = rustPlatform.fetchCargoVendor {
    inherit (finalAttrs) pname version src;
    hash = "sha256-RXpwDEd7RmsSySMHZJy0wH56cp+tNgimjMNSNE55Zv4=";
  };

  nativeBuildInputs = [
    pkg-config
    rustPlatform.cargoSetupHook
    rustPlatform.maturinBuildHook
  ];

  buildInputs = [
    pkgs.zstd
  ];

  env = {
    ZSTD_SYS_USE_PKG_CONFIG = true;
  };

  pythonImportsCheck = [ "tantivy" ];
  meta = {
    description = "Official Python bindings for the Tantivy search engine";
    homepage = "https://pypi.org/project/tantivy";
    license = lib.licenses.mit;
    maintainers = [ ];
  };
})
