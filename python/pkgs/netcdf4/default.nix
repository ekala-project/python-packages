{
  lib,
  buildPythonPackage,
  fetchFromGitHub,
  certifi,
  cftime,
  curl,
  cython,
  hdf5,
  isPyPy,
  libjpeg,
  netcdf,
  numpy,
  oldest-supported-numpy,
  setuptools-scm,
  stdenv,
  wheel,
  zlib,
}:

let
  version = "1.7.4";
  suffix = lib.optionalString (lib.match ".*\\.post[0-9]+" version == null) "rel";
  tag = "v${version}${suffix}";
in
buildPythonPackage {
  pname = "netcdf4";
  inherit version;
  pyproject = true;

  disabled = isPyPy;

  src = fetchFromGitHub {
    owner = "Unidata";
    repo = "netcdf4-python";
    inherit tag;
    hash = "sha256-b91Y6RnZ8JpaRBLwJqQ/I3a2rGGl9jv9tyGiI67Zbp4=";
  };

  build-system = [
    cython
    oldest-supported-numpy
    setuptools-scm
    wheel
  ];

  dependencies = [
    certifi
    cftime
    numpy
  ];

  buildInputs = [
    curl
    hdf5
    libjpeg
    netcdf
    zlib
  ];

  env = {
    USE_NCCONFIG = "0";
    HDF5_DIR = lib.getDev hdf5;
    NETCDF4_DIR = netcdf;
    CURL_DIR = curl.dev;
    JPEG_DIR = libjpeg.dev;
  }
  // lib.optionalAttrs stdenv.cc.isClang { NIX_CFLAGS_COMPILE = "-Wno-error=int-conversion"; };

  pythonImportsCheck = [ "netCDF4" ];

  meta = {
    description = "Interface to netCDF library (versions 3 and 4)";
    homepage = "https://github.com/Unidata/netcdf4-python";
    license = lib.licenses.mit;
    maintainers = [ ];
  };
}
