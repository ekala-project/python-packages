{
  lib,
  buildPythonPackage,
  fetchFromGitHub,
  rustPlatform,

  # tests
  pytest-mypy-plugins,
}:

buildPythonPackage (finalAttrs: {
  pname = "obstore";
  version = "0.9.4";
  pyproject = true;
  __structuredAttrs = true;

  src = fetchFromGitHub {
    owner = "developmentseed";
    repo = "obstore";
    tag = "py-v${finalAttrs.version}";
    hash = "sha256-u2o0ymusn/pWrEn8kK/kiE95VcmMln6StkDPBam+6u0=";
  };

  cargoDeps = rustPlatform.fetchCargoVendor {
    inherit (finalAttrs) pname version src;
    hash = "sha256-ZOYTGklsla89I1K2sI46AWy2xGfSfBVmnBcbCdSLKkg=";
  };

  # pytest-mypy-plugins 4.0 removed --mypy-only-local-stub
  postPatch = ''
    substituteInPlace pyproject.toml \
      --replace-fail '-v --mypy-only-local-stub' '-v'
  '';

  build-system = [
    rustPlatform.maturinBuildHook
    rustPlatform.cargoSetupHook
  ];

  maturinBuildFlags = [
    "-m"
    "obstore/Cargo.toml"
  ];

  pythonImportsCheck = [ "obstore" ];
  meta = {
    description = "Simple, high-throughput Python interface to S3, GCS & Azure Storage, powered by Rust";
    homepage = "https://github.com/developmentseed/obstore";
    license = lib.licenses.mit;
    maintainers = [ ];
  };
})
