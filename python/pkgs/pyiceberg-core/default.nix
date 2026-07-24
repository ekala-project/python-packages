{
  lib,
  buildPythonPackage,
  fetchFromGitHub,
  rustPlatform,

  # tests
  datafusion,
  fastavro,
  pyarrow,
  pyiceberg,
  pyiceberg-core,
}:

buildPythonPackage (finalAttrs: {
  pname = "pyiceberg-core";
  version = "0.9.1";
  pyproject = true;
  __structuredAttrs = true;

  src = fetchFromGitHub {
    owner = "apache";
    repo = "iceberg-rust";
    tag = "v${finalAttrs.version}";
    hash = "sha256-PE19tUEk3VmJ9h4JiBVYgbAVuQ3EzSngESj+CZc7ODs=";
  };

  sourceRoot = "${finalAttrs.src.name}/bindings/python";

  cargoDeps = rustPlatform.fetchCargoVendor {
    inherit (finalAttrs)
      pname
      version
      src
      sourceRoot
      ;
    hash = "sha256-aEk+K9dWwgkiE7Wx2J+rF3JLQ5deTqRm2sfFSphyALY=";
  };

  nativeBuildInputs = [
    rustPlatform.cargoSetupHook
    rustPlatform.maturinBuildHook
  ];

  pythonImportsCheck = [ "pyiceberg_core" ];
  # Circular dependency on pyiceberg
  doCheck = false;

  passthru.tests.pytest = pyiceberg-core.overridePythonAttrs {
  };

  meta = {
    description = "Iceberg-rust powered core for pyiceberg";
    homepage = "https://github.com/apache/iceberg-rust/tree/main/bindings/python";
    license = lib.licenses.asl20;
    maintainers = [ ];
  };
})
