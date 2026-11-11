{
  lib,
  stdenv,
  buildPythonPackage,
  fetchPypi,
  rustPlatform,
  cargo,
  rustc,
  setuptools,
  setuptools-rust,
  libiconv,
  requests,
  regex,
}:
let
  pname = "tiktoken";
  version = "0.14.0";
  src = fetchPypi {
    inherit pname version;
    hash = "sha256-Ix3skO/NzPG1ZaFBYQdzbx4JsaCP5zbvnWNj5ibQOHQ=";
  };
  postPatch = ''
    cp ${./Cargo.lock} Cargo.lock
  '';
in
buildPythonPackage {
  inherit
    pname
    version
    src
    postPatch
    ;
  pyproject = true;

  build-system = [
    setuptools
    setuptools-rust
  ];

  cargoDeps = rustPlatform.fetchCargoVendor {
    inherit
      pname
      version
      src
      postPatch
      ;
    hash = "sha256-6IXZk0N5fHqLi+wP514vKpjR5AA4lxjDHhDjh4AOJ5Q=";
  };

  nativeBuildInputs = [
    rustPlatform.cargoSetupHook
    setuptools-rust
    cargo
    rustc
  ];

  buildInputs = lib.optionals stdenv.hostPlatform.isDarwin [ libiconv ];

  dependencies = [
    requests
    regex
  ];

  pythonImportsCheck = [ "tiktoken" ];

  meta = {
    description = "Fast BPE tokeniser for use with OpenAI's models";
    homepage = "https://github.com/openai/tiktoken";
    license = lib.licenses.mit;
  };
}
