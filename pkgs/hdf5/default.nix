{
  lib,
  stdenv,
  fetchFromGitHub,
  fetchpatch,
  cmake,
  fixDarwinDylibNames,
  removeReferencesTo,
  cppSupport ? true,
  fortranSupport ? false,
  fortran ? gfortran,
  gfortran,
  zlibSupport ? true,
  zlib,
  szipSupport ? false,
  libaec ? null,
  mpiSupport ? false,
  mpi ? null,
  enableShared ? !stdenv.hostPlatform.isStatic,
  enableStatic ? stdenv.hostPlatform.isStatic,
  javaSupport ? false,
  jdk,
  apiVersion ? null,
  threadsafe ? false,
}:

let
  inherit (lib) optional optionals;
in

stdenv.mkDerivation rec {
  version = "1.14.6";
  pname =
    "hdf5"
    + lib.optionalString cppSupport "-cpp"
    + lib.optionalString fortranSupport "-fortran"
    + lib.optionalString mpiSupport "-mpi"
    + lib.optionalString threadsafe "-threadsafe";

  src = fetchFromGitHub {
    owner = "HDFGroup";
    repo = "hdf5";
    rev = "hdf5_${version}";
    hash = "sha256-mJTax+VWAL3Amkq3Ij8fxazY2nfpMOTxYMUQlTvY/rg=";
  };

  patches = [
    (fetchpatch {
      name = "reproducible-build.patch";
      url = "https://gitlab.archlinux.org/archlinux/packaging/packages/hdf5/-/raw/721d33408db902ff738db18f1e977611d49b4ba8/hdf5-make-reproducible.patch";
      hash = "sha256-Z31dCsLjYpqjoGXooOXI81EPjPwyTK8890xCENTh8aM=";
    })
  ];

  passthru = {
    inherit
      cppSupport
      fortranSupport
      fortran
      zlibSupport
      zlib
      szipSupport
      libaec
      mpiSupport
      mpi
      ;
  };

  outputs = [
    "out"
    "dev"
    "bin"
  ];

  nativeBuildInputs = [
    removeReferencesTo
    cmake
    cmake.configurePhaseHook
  ]
  ++ optional stdenv.hostPlatform.isDarwin fixDarwinDylibNames
  ++ optional fortranSupport fortran;

  buildInputs =
    optional fortranSupport fortran ++ optional szipSupport libaec ++ optional javaSupport jdk;

  propagatedBuildInputs = optional zlibSupport zlib ++ optional mpiSupport mpi;

  cmakeFlags = [
    "-DHDF5_INSTALL_CMAKE_DIR=${placeholder "dev"}/lib/cmake"
    (lib.cmakeBool "BUILD_STATIC_LIBS" enableStatic)
    (lib.cmakeBool "BUILD_SHARED_LIBS" enableShared)
    (lib.cmakeBool "HDF5_BUILD_CPP_LIB" cppSupport)
    (lib.cmakeBool "HDF5_BUILD_FORTRAN" fortranSupport)
    (lib.cmakeBool "HDF5_ENABLE_SZIP_SUPPORT" szipSupport)
    (lib.cmakeBool "HDF5_ENABLE_PARALLEL" mpiSupport)
    (lib.cmakeBool "HDF5_BUILD_JAVA" javaSupport)
    (lib.cmakeBool "HDF5_ENABLE_THREADSAFE" threadsafe)
    (lib.cmakeBool "HDF5_BUILD_HL_LIB" (!threadsafe))
    (lib.cmakeBool "HDF5_ENABLE_NONSTANDARD_FEATURE_FLOAT16" (
      with stdenv.hostPlatform; !(isDarwin && isx86_64)
    ))
  ]
  ++ lib.optional (apiVersion != null) (lib.cmakeFeature "HDF5_DEFAULT_API_VERSION" apiVersion);

  postInstall = ''
    find "$out" -type f -exec remove-references-to -t ${stdenv.cc} '{}' +
    moveToOutput 'bin/' "''${!outputBin}"
    moveToOutput 'bin/h5cc' "''${!outputDev}"
    moveToOutput 'bin/h5c++' "''${!outputDev}"
    moveToOutput 'bin/h5fc' "''${!outputDev}"
    moveToOutput 'bin/h5pcc' "''${!outputDev}"
    moveToOutput 'bin/h5hlcc' "''${!outputDev}"
    moveToOutput 'bin/h5hlc++' "''${!outputDev}"
  ''
  + lib.optionalString enableShared ''
    pushd ''${!outputBin}/bin
    for file in *-shared; do
      mv "$file" "''${file%%-shared}"
    done
    popd
  ''
  + lib.optionalString fortranSupport ''
    mv $out/mod/shared $dev/include
    rm -r $out/mod

    find "$out" -type f -exec remove-references-to -t ${fortran} '{}' +
  '';

  enableParallelBuilding = true;

  meta = {
    description = "Data model, library, and file format for storing and managing data";
    license = lib.licenses.bsd3;
    homepage = "https://www.hdfgroup.org/HDF5/";
    platforms = lib.platforms.unix;
    maintainers = [ ];
  };
}
