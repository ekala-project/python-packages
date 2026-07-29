{
  lib,
  stdenv,
  fetchurl,
  unzip,
  hdf5,
  bzip2,
  libzip,
  zstd,
  libxml2,
  m4,
  curl,
  removeReferencesTo,
}:

let
  inherit (hdf5) mpiSupport mpi;
in
stdenv.mkDerivation (finalAttrs: {
  pname = "netcdf" + lib.optionalString mpiSupport "-mpi";
  version = "4.10.1";

  src = fetchurl {
    url = "https://downloads.unidata.ucar.edu/netcdf-c/${finalAttrs.version}/netcdf-c-${finalAttrs.version}.tar.gz";
    hash = "sha256-2ztp/0pe4afXmlw2Zk0hKLdSwmbpZjafz3MR7F+SdWQ=";
  };

  postPatch = ''
    patchShebangs .

    # this test requires the net
    for a in ncdap_test/Makefile.am ncdap_test/Makefile.in; do
      substituteInPlace $a --replace testurl.sh " "
    done

    # Prevent building the tests from prepending `#!/bin/bash` and wiping out the patched shebangs.
    substituteInPlace nczarr_test/Makefile.in \
      --replace '#!/bin/bash' '${stdenv.shell}'
  '';

  nativeBuildInputs = [
    m4
    removeReferencesTo
    libxml2
  ];

  buildInputs = [
    curl
    hdf5
    libxml2
    bzip2
    libzip
    zstd
  ]
  ++ lib.optional mpiSupport mpi;

  strictDeps = true;

  passthru = {
    inherit mpiSupport mpi;
  };

  env.NIX_CFLAGS_COMPILE = lib.optionalString stdenv.cc.isClang "-Wno-error=incompatible-function-pointer-types";

  configureFlags = [
    "--enable-netcdf-4"
    "--enable-dap"
    "--enable-shared"
    "--disable-dap-remote-tests"
    "--with-plugin-dir=${placeholder "out"}/lib/hdf5-plugins"
  ]
  ++ (lib.optionals mpiSupport [
    "--enable-parallel-tests"
    "CC=${lib.getDev mpi}/bin/mpicc"
  ]);

  enableParallelBuilding = true;

  disallowedReferences = [ stdenv.cc ];

  postFixup = ''
    remove-references-to -t ${stdenv.cc} "$(readlink -f $out/lib/libnetcdf.settings)"
  '';

  doCheck = !mpiSupport;
  nativeCheckInputs = [ unzip ];

  preCheck = ''
    export HOME=$TEMP
  '';

  meta = {
    description = "Libraries for the Unidata network Common Data Format";
    platforms = lib.platforms.unix;
    homepage = "https://www.unidata.ucar.edu/software/netcdf/";
    license = lib.licenses.bsd3;
    maintainers = [ ];
  };
})
