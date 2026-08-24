{ lib
, buildPythonPackage
, fetchFromGitHub
, scikit-build-core
, nanobind
, cmake
, ninja
, pkg-config
, blas
, lapack
, numpy
,
}:

buildPythonPackage (finalAttrs: {
  pname = "fenics-basix";
  version = "0.11.0";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "fenics";
    repo = "basix";
    tag = "v${finalAttrs.version}";
    hash = "sha256-MBrK7O3iQ0XFONebbAFXBom9i985EyTAXrOlSMiIpk8=";
  };

  dontUseCmakeConfigure = true;

  build-system = [
    scikit-build-core
    nanobind
  ];

  nativeBuildInputs = [
    cmake
    ninja
    pkg-config
  ];

  dependencies = [
    numpy
  ];

  buildInputs = [
    blas
    lapack
  ];

  cmakeFlags = [
    # Prefer finding BLAS and LAPACK via pkg-config.
    # Avoid using the Accelerate.framework from the Darwin SDK.
    # Also, avoid mistaking BLAS for LAPACK.
    (lib.cmakeBool "BLA_PREFER_PKGCONFIG" true)
  ];

  pythonImportsCheck = [
    "basix"
  ];

  meta = {
    homepage = "https://fenicsproject.org";
    downloadPage = "https://github.com/fenics/basix";
    description = "Finite element definition and tabulation runtime library";
    license = lib.licenses.mit;
    maintainers = [ ];
  };
})
