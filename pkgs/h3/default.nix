{
  lib,
  stdenv,
  cmake,
  fetchFromGitHub,
}:

stdenv.mkDerivation {
  pname = "h3";
  version = "4.4.1";

  src = fetchFromGitHub {
    owner = "uber";
    repo = "h3";
    tag = "v4.4.1";
    hash = "sha256-tKonXauTJiOb5DV56tOmnvba7eNYcWTnOvCSokheVsY=";
  };

  outputs = [
    "out"
    "dev"
  ];

  nativeBuildInputs = [ cmake ];

  cmakeFlags = [
    (lib.cmakeBool "BUILD_SHARED_LIBS" true)
    (lib.cmakeBool "BUILD_BENCHMARKS" false)
    (lib.cmakeBool "BUILD_FUZZERS" false)
    (lib.cmakeBool "BUILD_GENERATORS" false)
    (lib.cmakeBool "ENABLE_COVERAGE" false)
    (lib.cmakeBool "ENABLE_FORMAT" false)
    (lib.cmakeBool "ENABLE_LINTING" false)
    (lib.cmakeBool "BUILD_FILTERS" false)
  ];

  meta = {
    homepage = "https://h3geo.org/";
    description = "Hexagonal hierarchical geospatial indexing system";
    license = lib.licenses.asl20;
    platforms = lib.platforms.all;
    maintainers = [ ];
  };
}
