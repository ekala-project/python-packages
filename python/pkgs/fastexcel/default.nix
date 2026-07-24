{
  lib,
  buildPythonPackage,
  fetchFromGitHub,
  rustPlatform,

  # nativeBuildInputs
  cargo,
  rustc,

  # optional-dependencies
  pandas,
  polars,
  pyarrow,

  # tests
  pytest-mock,
}:

buildPythonPackage (finalAttrs: {
  pname = "fastexcel";
  version = "0.20.2";
  pyproject = true;
  __structuredAttrs = true;

  src = fetchFromGitHub {
    owner = "ToucanToco";
    repo = "fastexcel";
    tag = "v${finalAttrs.version}";
    hash = "sha256-lceUFw9+FsEoCWSNieCYGJW+pCqCpfthEAFCfXKdpj0=";
  };

  cargoDeps = rustPlatform.fetchCargoVendor {
    inherit (finalAttrs) pname version src;
    hash = "sha256-04jqysfab+mEir1f2kc15DCdueu1h+HS4FOIol4sBZY=";
  };

  nativeBuildInputs = [
    cargo
    rustPlatform.cargoSetupHook
    rustPlatform.maturinBuildHook
    rustc
  ];

  optional-dependencies = {
    pyarrow = [
      pyarrow
    ];
    pandas = [
      pandas
      pyarrow
    ];
    polars = [
      polars
    ];
  };

  pythonImportsCheck = [
    "fastexcel"
    "fastexcel._fastexcel"
  ];
  meta = {
    description = "Fast excel file reader for Python, written in Rust";
    homepage = "https://github.com/ToucanToco/fastexcel/";
    license = lib.licenses.mit;
    maintainers = [ ];
  };
})
