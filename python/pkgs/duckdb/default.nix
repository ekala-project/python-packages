{
  lib,
  buildPythonPackage,
  fetchFromGitHub,
  cmake,
  ninja,
  openssl,
  pybind11,
  scikit-build-core,
  setuptools-scm,
}:

let
  # DuckDB C++ source (used as a submodule by the Python package)
  duckdbVersion = "1.5.2";
  duckdbRev = "8a5851971fae891f292c2714d86046ee018e9737";
  duckdbSrc = fetchFromGitHub {
    owner = "duckdb";
    repo = "duckdb";
    tag = "v${duckdbVersion}";
    hash = "sha256-FWoVF7s/n28NN1HtnO0Cr3YyoIDgJcWBtBiO7vWiSOU=";
  };
in

buildPythonPackage rec {
  pname = "duckdb";
  version = duckdbVersion;
  pyproject = true;

  src = fetchFromGitHub {
    owner = "duckdb";
    repo = "duckdb-python";
    tag = "v${version}";
    hash = "sha256-B14dXW5pPnToiKbSD9ACzNksIhBG+ui1P9l67Qyke8o=";
  };

  postPatch = ''
    # The build depends on a duckdb git submodule
    rm -r external/duckdb
    ln -s ${duckdbSrc} external/duckdb

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
    openssl
  ];

  env = {
    DUCKDB_BUILD_UNITY = 1;
    # default to disabled extension autoload/autoinstall
    CMAKE_DEFINE_DUCKDB_EXTENSION_AUTOLOAD_DEFAULT = "0";
    CMAKE_DEFINE_DUCKDB_EXTENSION_AUTOINSTALL_DEFAULT = "0";
  };

  cmakeFlags = [
    (lib.cmakeFeature "OVERRIDE_GIT_DESCRIBE" "v${version}-0-g${duckdbRev}")
  ];

  pythonImportsCheck = [ "duckdb" ];

  meta = {
    description = "Python binding for DuckDB";
    homepage = "https://duckdb.org/";
    license = lib.licenses.mit;
  };
}
