{ lib
, stdenv
, buildPythonPackage
, fetchFromGitHub
, fetchpatch
, llvmPackages
, zlib
, cython
, numpy
, setuptools
, versioneer
, wheel
, netcdf4
, packaging
, pyparsing
, scipy
,
}:

buildPythonPackage rec {
  pname = "mdtraj";
  version = "1.11.1";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "mdtraj";
    repo = "mdtraj";
    tag = version;
    hash = "sha256-xSXfV/lrUy33RSOpz3FsX5HP1Wr84rKCYmEKNVVnQao=";
  };

  patches = [
    # disable intrinsics when SIMD is not available
    # TODO: enable SIMD with python3.12
    # https://github.com/mdtraj/mdtraj/pull/1884
    (fetchpatch {
      name = "fix-intrinsics-flag.patch";
      url = "https://github.com/mdtraj/mdtraj/commit/d6041c645d51898e2a09030633210213eec7d4c5.patch";
      hash = "sha256-kcnlHMoA/exJzV8iQltH+LWXrvSk7gsUV+yWK6xn0jg=";
    })
  ];

  build-system = [
    cython
    numpy
    setuptools
    versioneer
    wheel
  ];

  buildInputs = [ zlib ] ++ lib.optionals stdenv.cc.isClang [ llvmPackages.openmp ];

  dependencies = [
    netcdf4
    numpy
    packaging
    pyparsing
    scipy
  ];

  env.NIX_CFLAGS_COMPILE = lib.optionalString stdenv.cc.isClang "-Wno-incompatible-function-pointer-types";

  # these files import distutils
  # remove once https://github.com/mdtraj/mdtraj/pull/1916 is merged
  pythonImportsCheck = [ "mdtraj" ];

  meta = {
    description = "Open library for the analysis of molecular dynamics trajectories";
    homepage = "https://github.com/mdtraj/mdtraj";
    license = lib.licenses.lgpl21Plus;
    maintainers = [ ];
  };
}
