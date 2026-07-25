{
  lib,
  buildPythonPackage,
  cargo,
  rustPlatform,
  rustc,
  setuptools,
  setuptools-rust,
  fetchFromGitHub,
}:

buildPythonPackage rec {
  pname = "bcrypt";
  version = "5.0.0";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "pyca";
    repo = "bcrypt";
    tag = version;
    hash = "sha256-7Dp07xoq6h+fiP7d7/TRRoYszWsyQF1c4vuFUpZ7u6U=";
  };

  cargoRoot = "src/_bcrypt";
  cargoDeps = rustPlatform.fetchCargoVendor {
    inherit
      pname
      version
      src
      cargoRoot
      ;
    hash = "sha256-hYMJlwxnXA0ZOJiyZ8rDp9govVcc1SGkDfqUVngnUPQ=";
  };

  build-system = [
    setuptools
    setuptools-rust
  ];

  nativeBuildInputs = [
    rustPlatform.cargoSetupHook
    cargo
    rustc
  ];
  pythonImportsCheck = [ "bcrypt" ];
  meta = {
    description = "Modern password hashing for your software and your servers";
    homepage = "https://github.com/pyca/bcrypt/";
    license = lib.licenses.asl20;
    maintainers = [ lib.maintainers.dotlambda ];
  };
}
