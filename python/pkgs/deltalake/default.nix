{
  lib,
  buildPythonPackage,
  fetchPypi,
  rustPlatform,
  arro3-core,
  pyarrow,
  openssl,
  stdenv,
  libiconv,
  pkg-config,
  pandas,
  deprecated,
  writableTmpDirAsHomeHook,
}:

buildPythonPackage (finalAttrs: {
  pname = "deltalake";
  version = "1.6.6";
  pyproject = true;

  src = fetchPypi {
    inherit (finalAttrs) pname version;
    hash = "sha256-kYZNl620KfqLh0i09o1pras9BBf/qfEAvbhYBYkMmX8=";
  };

  cargoDeps = rustPlatform.fetchCargoVendor {
    inherit (finalAttrs) src;
    hash = "sha256-PELrTQyjD+Rqh+kco57WahmpW/qBykd/3MVbejHsozk=";
  };

  env.OPENSSL_NO_VENDOR = 1;

  dependencies = [
    arro3-core
    deprecated
  ];

  buildInputs = [
    openssl
  ]
  ++ lib.optionals stdenv.hostPlatform.isDarwin [
    libiconv
  ];

  nativeBuildInputs = [
    pkg-config
    writableTmpDirAsHomeHook
  ]
  ++ (with rustPlatform; [
    cargoSetupHook
    maturinBuildHook
  ]);

  optional-dependencies = {
    pandas = [ pandas ];
    pyarrow = [ pyarrow ];
  };

  pythonImportsCheck = [ "deltalake" ];

  meta = {
    description = "Native Rust library for Delta Lake, with bindings into Python";
    homepage = "https://github.com/delta-io/delta-rs";
    license = lib.licenses.asl20;
  };
})
