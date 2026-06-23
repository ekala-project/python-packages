{
  lib,
  buildPythonPackage,
  fetchFromGitHub,
  cmake,
  ninja,
  duckdb,
  fsspec,
  ipython,
  numpy,
  openssl,
  pandas,
  pyarrow,
  pybind11,
  scikit-build-core,
  setuptools-scm,
}:

buildPythonPackage rec {
  inherit (duckdb)
    pname
    version # nixpkgs-update: no auto update
    ;
  pyproject = true;

  src = fetchFromGitHub {
    owner = "duckdb";
    repo = "duckdb-python";
    tag = "v${version}";
    hash = duckdb.passthru.pythonHash;
  };

  postPatch = ''
    # The build depends on a duckdb git submodule
    rm -r external/duckdb
    ln -s ${duckdb.src} external/duckdb

    # replace pybind11[global] with pybind11
    substituteInPlace pyproject.toml \
      --replace-fail "pybind11[global]" "pybind11"

    # replace custom build backend with standard scikit-build-core
    substituteInPlace pyproject.toml \
      --replace-fail 'build-backend = "duckdb_packaging.build_backend"' \
                     'build-backend = "scikit_build_core.build"' \
      --replace-fail 'backend-path = ["./"]' \
                     '# backend-path removed'
  '';

  nativeBuildInputs = [
    cmake
    ninja
  ];

  dontUseCmakeConfigure = true;

  build-system = [
    pybind11
    scikit-build-core
    setuptools-scm
  ];

  buildInputs = [
    duckdb
    openssl
  ];

  optional-dependencies = {
    all = [
      # FIXME package adbc_driver_manager
      ipython
      fsspec
      numpy
      pandas
      pyarrow
    ];
  };

  env = {
    DUCKDB_BUILD_UNITY = 1;
    # default to disabled extension autoload/autoinstall
    CMAKE_DEFINE_DUCKDB_EXTENSION_AUTOLOAD_DEFAULT = "0";
    CMAKE_DEFINE_DUCKDB_EXTENSION_AUTOINSTALL_DEFAULT = "0";
  };

  cmakeFlags = [
    (lib.cmakeFeature "OVERRIDE_GIT_DESCRIBE" "v${version}-0-g${duckdb.rev}")
  ];

  pythonImportsCheck = [ "duckdb" ];

  meta = {
    description = "Python binding for DuckDB";
    homepage = "https://duckdb.org/";
    license = lib.licenses.mit;
  };
}
