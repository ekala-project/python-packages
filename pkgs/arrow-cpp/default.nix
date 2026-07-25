{
  stdenv,
  lib,
  fetchurl,
  fetchFromGitHub,
  fixDarwinDylibNames,
  apache-orc,
  autoconf,
  boost,
  brotli,
  bzip2,
  cmake,
  crc32c,
  curl,
  flatbuffers,
  gflags,
  glog,
  grpc,
  gtest,
  libbacktrace,
  lz4,
  ninja,
  nlohmann_json,
  openssl,
  perl,
  pkg-config,
  protobuf,
  python3,
  rapidjson,
  re2,
  snappy,
  sqlite,
  thrift,
  tzdata,
  utf8proc,
  which,
  zlib,
  zstd,
  enableShared ? !stdenv.hostPlatform.isStatic,
  enableFlight ? stdenv.buildPlatform == stdenv.hostPlatform,
  enableJemalloc ?
    !stdenv.hostPlatform.isDarwin && !stdenv.hostPlatform.isAarch64 && !stdenv.hostPlatform.isRiscV64,
  enableS3 ? false,
  enableGcs ? false,
  enableAzure ? false,
}:

let
  version = "24.0.0";
in
stdenv.mkDerivation (finalAttrs: {
  pname = "arrow-cpp";
  inherit version;

  src = fetchFromGitHub {
    owner = "apache";
    repo = "arrow";
    rev = "apache-arrow-${version}";
    hash = "sha256-qTdkzZegANNvtO7nbqXVC8hc7BexvmeFF/0l5VzRb8g=";
  };

  sourceRoot = "${finalAttrs.src.name}/cpp";

  env =
    lib.optionalAttrs enableJemalloc {
      ARROW_JEMALLOC_URL = fetchurl {
        url = "https://github.com/jemalloc/jemalloc/releases/download/5.3.0/jemalloc-5.3.0.tar.bz2";
        hash = "sha256-LbgtHnEZ3z5xt2QCGbbf6EeJvAU3mDw7esT3GJrs/qo=";
      };
    }
    // {
      ARROW_MIMALLOC_URL = fetchFromGitHub {
        owner = "microsoft";
        repo = "mimalloc";
        tag = "v3.1.5";
        hash = "sha256-fk6nfyBFS1G0sJwUJVgTC1+aKd0We/JjsIYTO+IOfyg=";
      };

      ARROW_XSIMD_URL = fetchFromGitHub {
        owner = "xtensor-stack";
        repo = "xsimd";
        tag = "14.0.0";
        hash = "sha256-ijNoHb6xC+OHJbUB4j1PRsoHMzjrnOHVoDRe/nKguDo=";
      };

      ARROW_SUBSTRAIT_URL = fetchFromGitHub {
        owner = "substrait-io";
        repo = "substrait";
        tag = "v0.44.0";
        hash = "sha256-V739IFTGPtbGPlxcOi8sAaYSDhNUEpITvN9IqdPReug=";
      };

      LZ4_HOME = lz4;
      PROTOBUF_HOME = protobuf;
      SNAPPY_HOME = snappy.dev;
      ZSTD_HOME = zstd.dev;
    };

  nativeBuildInputs = [
    cmake
    cmake.configurePhaseHook
    pkg-config
    ninja
    autoconf # for vendored jemalloc
    flatbuffers
  ]
  ++ lib.optional stdenv.hostPlatform.isDarwin fixDarwinDylibNames;

  buildInputs = [
    apache-orc
    boost
    brotli
    bzip2
    curl
    flatbuffers
    gflags
    glog
    gtest
    libbacktrace
    lz4
    nlohmann_json
    protobuf
    rapidjson
    re2
    snappy
    thrift
    utf8proc
    zlib
    zstd
  ]
  ++ lib.optionals enableFlight [
    grpc
    openssl
    protobuf
    sqlite
  ];

  # fails tests on glibc with this enabled
  hardeningDisable = [ "glibcxxassertions" ];

  preConfigure = ''
    patchShebangs build-support/
    substituteInPlace "src/arrow/vendored/datetime/tz.cpp" \
      --replace-fail 'discover_tz_dir();' '"${tzdata}/share/zoneinfo";'
  '';

  cmakeFlags = [
    (lib.cmakeBool "CMAKE_FIND_PACKAGE_PREFER_CONFIG" true)
    (lib.cmakeBool "ARROW_BUILD_SHARED" enableShared)
    (lib.cmakeBool "ARROW_BUILD_STATIC" (!enableShared))
    (lib.cmakeBool "ARROW_BUILD_TESTS" false)
    (lib.cmakeBool "ARROW_BUILD_INTEGRATION" true)
    (lib.cmakeBool "ARROW_BUILD_UTILITIES" true)
    (lib.cmakeBool "ARROW_EXTRA_ERROR_CONTEXT" true)
    (lib.cmakeBool "ARROW_VERBOSE_THIRDPARTY_BUILD" true)
    (lib.cmakeFeature "ARROW_DEPENDENCY_SOURCE" "SYSTEM")
    (lib.cmakeFeature "xsimd_SOURCE" "AUTO")
    (lib.cmakeBool "ARROW_DEPENDENCY_USE_SHARED" enableShared)
    (lib.cmakeBool "ARROW_COMPUTE" true)
    (lib.cmakeBool "ARROW_CSV" true)
    (lib.cmakeBool "ARROW_DATASET" true)
    (lib.cmakeBool "ARROW_FILESYSTEM" true)
    (lib.cmakeBool "ARROW_FLIGHT_SQL" enableFlight)
    (lib.cmakeBool "ARROW_HDFS" true)
    (lib.cmakeBool "ARROW_IPC" true)
    (lib.cmakeBool "ARROW_JEMALLOC" enableJemalloc)
    (lib.cmakeBool "ARROW_JSON" true)
    (lib.cmakeBool "ARROW_USE_GLOG" true)
    (lib.cmakeBool "ARROW_WITH_BACKTRACE" true)
    (lib.cmakeBool "ARROW_WITH_BROTLI" true)
    (lib.cmakeBool "ARROW_WITH_BZ2" true)
    (lib.cmakeBool "ARROW_WITH_LZ4" true)
    (lib.cmakeBool "ARROW_WITH_NLOHMANN_JSON" true)
    (lib.cmakeBool "ARROW_WITH_SNAPPY" true)
    (lib.cmakeBool "ARROW_WITH_UTF8PROC" true)
    (lib.cmakeBool "ARROW_WITH_ZLIB" true)
    (lib.cmakeBool "ARROW_WITH_ZSTD" true)
    (lib.cmakeBool "ARROW_MIMALLOC" true)
    (lib.cmakeBool "ARROW_SUBSTRAIT" true)
    (lib.cmakeBool "ARROW_FLIGHT" enableFlight)
    (lib.cmakeBool "ARROW_FLIGHT_TESTING" enableFlight)
    (lib.cmakeBool "ARROW_S3" enableS3)
    (lib.cmakeBool "ARROW_GCS" enableGcs)
    (lib.cmakeBool "ARROW_AZURE" enableAzure)
    (lib.cmakeBool "ARROW_ORC" true)
    # Parquet options:
    (lib.cmakeBool "ARROW_PARQUET" true)
    (lib.cmakeBool "PARQUET_BUILD_EXECUTABLES" true)
    (lib.cmakeBool "PARQUET_REQUIRE_ENCRYPTION" true)
  ]
  ++ lib.optionals (!enableShared) [
    (lib.cmakeFeature "ARROW_TEST_LINKAGE" "static")
  ]
  ++ lib.optionals stdenv.hostPlatform.isDarwin [
    (lib.cmakeFeature "CMAKE_INSTALL_RPATH" "@loader_path/../lib")
  ]
  ++ lib.optionals (!stdenv.hostPlatform.isx86_64) [
    (lib.cmakeBool "ARROW_USE_SIMD" false)
  ];

  __structuredAttrs = true;

  passthru = {
    inherit
      enableFlight
      enableJemalloc
      enableS3
      enableGcs
      ;
  };

  meta = {
    description = "Cross-language development platform for in-memory data";
    homepage = "https://arrow.apache.org/docs/cpp/";
    license = lib.licenses.asl20;
    platforms = lib.platforms.unix;
    maintainers = [ ];
  };
})
