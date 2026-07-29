{
  lib,
  buildPythonPackage,
  fetchFromGitHub,
  rustPlatform,
}:
let
  version = "0.8.1";

  src = fetchFromGitHub {
    owner = "kylebarron";
    repo = "arro3";
    tag = "py-v${version}";
    hash = "sha256-24aMiFHQdwZwTthPt7GILjQzbbLp3K2UcXYw3ZGWUJ4=";
  };

  cargoDeps = rustPlatform.fetchCargoVendor {
    inherit version src;
    pname = "arro3-vendor";
    hash = "sha256-8pD7vfGtwknUKLQ/DARmRvvnffBqbGLY9lWJgU7VvWM=";
  };

  commonMeta = {
    homepage = "https://github.com/kylebarron/arro3";
    license = lib.licenses.asl20;
    maintainers = [ ];
  };

  buildArro3Package =
    {
      pname,
      subdir,
      description,
      pythonImportsCheck,
      dependencies ? [ ],
    }:
    buildPythonPackage {
      inherit
        pname
        version
        src
        cargoDeps
        dependencies
        pythonImportsCheck
        ;
      pyproject = true;

      sourceRoot = "${src.name}/${subdir}";
      cargoRoot = "..";

      nativeBuildInputs = with rustPlatform; [
        cargoSetupHook
        maturinBuildHook
      ];

      env = {
        CARGO_TARGET_DIR = "./target";
      };

      meta = commonMeta // {
        inherit description;
      };
    };

  arro3-core = buildArro3Package {
    pname = "arro3-core";
    subdir = "arro3-core";
    description = "Core library for representing Arrow data in Python";
    pythonImportsCheck = [ "arro3.core" ];
  };

  arro3-compute = buildArro3Package {
    pname = "arro3-compute";
    subdir = "arro3-compute";
    description = "Rust-based compute kernels for Arrow in Python";
    pythonImportsCheck = [ "arro3.compute" ];
    dependencies = [ arro3-core ];
  };

  arro3-io = buildArro3Package {
    pname = "arro3-io";
    subdir = "arro3-io";
    description = "Rust-based readers and writers for Arrow in Python";
    pythonImportsCheck = [ "arro3.io" ];
    dependencies = [ arro3-core ];
  };
in
{
  inherit arro3-core arro3-io arro3-compute;
}
