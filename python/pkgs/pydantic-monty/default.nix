{
  lib,
  buildPythonPackage,
  fetchFromGitHub,
  rustPlatform,

  anyio,
  dirty-equals,
  inline-snapshot,
  pytest-examples,
  pytest-pretty,
  typing-extensions,
}:

buildPythonPackage (finalAttrs: {
  pname = "pydantic-monty";
  version = "0.0.17";
  pyproject = true;

  __structuredAttrs = true;

  src = fetchFromGitHub {
    owner = "pydantic";
    repo = "monty";
    tag = "v${finalAttrs.version}";
    hash = "sha256-f+WcznnOMSc0ahgfvgVec4U0nH9j022NLnWQLdISv3M=";
  };

  cargoDeps = rustPlatform.fetchCargoVendor {
    inherit (finalAttrs) pname src version;
    hash = "sha256-y+vi7kZPavBNnIeLpAoKO2YcBTq2d9yeDl+eoRJV1Tk=";
  };

  dependencies = [ typing-extensions ];

  nativeBuildInputs = [
    rustPlatform.cargoSetupHook
    rustPlatform.maturinBuildHook
  ];

  maturinBuildFlags = [
    "-m"
    "crates/monty-python/Cargo.toml"
  ];
  pythonImportsCheck = [ "pydantic_monty" ];

  meta = {
    description = "Minimal, secure Python interpreter written in Rust for use by AI";
    homepage = "https://github.com/pydantic/monty";
    license = lib.licenses.mit;
    maintainers = [ ];
  };
})
