{
  lib,
  buildPythonPackage,
  fetchFromGitHub,

  # build-system
  setuptools,

  # patches
  replaceVars,
  fetchpatch,
  pkgs,

  # nativeBuildInputs
  jdk,

  # dependencies
  antlr4-python3-runtime,
  omegaconf,
  packaging,
}:

let
  antlr4 = pkgs.antlr4;
in
buildPythonPackage (finalAttrs: {
  pname = "hydra-core";
  version = "1.3.4";
  pyproject = true;
  __structuredAttrs = true;

  src = fetchFromGitHub {
    owner = "facebookresearch";
    repo = "hydra";
    tag = "v${finalAttrs.version}";
    hash = "sha256-H947PLC0lkV9WJXXLtC0ThWHaAlsdWY6YSWiuRD9Y00=";
  };

  patches = [
    (replaceVars ./antlr4.patch {
      antlr_jar = "${antlr4.out}/share/java/antlr-${antlr4.version}-complete.jar";
    })
    (fetchpatch {
      name = "setuptools-67.5.0-test-compatibility.patch";
      url = "https://github.com/facebookresearch/hydra/commit/25873841ed8159ab25a0c652781c75cc4a9d6e08.patch";
      hash = "sha256-oUfHlJP653o3RDtknfb8HaaF4fpebdR/OcbKHzJFK/Q=";
    })
  ];

  postPatch = ''
    rm -v build_helpers/bin/antlr*-complete.jar
  '';

  build-system = [
    setuptools
  ];

  nativeBuildInputs = [ jdk ];

  pythonRelaxDeps = [
    "antlr4-python3-runtime"
  ];

  dependencies = [
    antlr4-python3-runtime
    omegaconf
    packaging
  ];

  pythonImportsCheck = [
    "hydra"
    "hydra.version"
  ];

  meta = {
    description = "Framework for configuring complex applications";
    homepage = "https://hydra.cc";
    license = lib.licenses.mit;
    maintainers = [ ];
  };
})
