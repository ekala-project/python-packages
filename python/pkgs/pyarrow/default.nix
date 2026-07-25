{
  lib,
  stdenv,
  buildPythonPackage,
  python,
  arrow-cpp,
  cffi,
  cmake,
  cython,
  libcst,
  ninja,
  numpy,
  pkg-config,
  scikit-build-core,
  setuptools,
  setuptools-scm,
}:

let
  zero_or_one = cond: if cond then 1 else 0;
in

buildPythonPackage rec {
  pname = "pyarrow";
  inherit (arrow-cpp) version src;
  pyproject = true;

  sourceRoot = "${src.name}/python";

  build-system = [
    scikit-build-core
    cmake
    cython
    libcst
    ninja
    numpy
    pkg-config
    setuptools
    setuptools-scm
  ];

  buildInputs = [ arrow-cpp ];

  dependencies = [
    cffi
    numpy
  ];

  env = {
    PYARROW_BUILD_TYPE = "release";

    PYARROW_WITH_DATASET = zero_or_one true;
    PYARROW_WITH_FLIGHT = zero_or_one arrow-cpp.enableFlight;
    PYARROW_WITH_HDFS = zero_or_one true;
    PYARROW_WITH_PARQUET = zero_or_one true;
    PYARROW_WITH_PARQUET_ENCRYPTION = zero_or_one true;
    PYARROW_WITH_S3 = zero_or_one arrow-cpp.enableS3;
    PYARROW_WITH_GCS = zero_or_one arrow-cpp.enableGcs;
    PYARROW_BUNDLE_ARROW_CPP_HEADERS = zero_or_one false;

    PYARROW_CMAKE_OPTIONS = toString [
      "-DCMAKE_INSTALL_RPATH=${arrow-cpp}/lib"
    ];

    ARROW_HOME = arrow-cpp;
    PARQUET_HOME = arrow-cpp;
  };

  doCheck = false;

  dontUseCmakeConfigure = true;

  preBuild = ''
    export PYARROW_PARALLEL=$NIX_BUILD_CORES
  '';

  postInstall = ''
    # copy the pyarrow C++ header files to the appropriate location
    pyarrow_include="$out/${python.sitePackages}/pyarrow/include"
    mkdir -p "$pyarrow_include/arrow/python"
    find "$PWD/pyarrow/src/arrow" -type f -name '*.h' -exec cp {} "$pyarrow_include/arrow/python" \;
  '';

  pythonImportsCheck = [
    "pyarrow"
  ]
  ++ map (module: "pyarrow.${module}") (
    [
      "compute"
      "csv"
      "dataset"
      "feather"
      "fs"
      "json"
      "orc"
      "parquet"
    ]
    ++ lib.optionals arrow-cpp.enableFlight [
      "flight"
    ]
  );

  meta = {
    description = "Cross-language development platform for in-memory data";
    homepage = "https://arrow.apache.org/";
    license = lib.licenses.asl20;
    platforms = lib.platforms.unix;
    maintainers = [ ];
  };
}
