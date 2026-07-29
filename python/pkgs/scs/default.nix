{
  lib,
  stdenv,
  pkgs,
  buildPythonPackage,
  fetchFromGitHub,

  # build-system
  meson-python,
  numpy,
  pkg-config,

  blas,
  lapack,

  # dependencies
  scipy,
}:

buildPythonPackage (finalAttrs: {
  pname = "scs";
  inherit (pkgs.scs) version;
  pyproject = true;

  src = fetchFromGitHub {
    owner = "bodono";
    repo = "scs-python";
    tag = finalAttrs.version;
    fetchSubmodules = true;
    hash = "sha256-ZB1A6613ZgwGsZ97MpK9c1vUfNe+0RkUULtzQxGKd88=";
  };

  postPatch = ''
    substituteInPlace pyproject.toml \
      --replace-fail "numpy >= 2.0.0" "numpy"
  '';

  build-system = [
    meson-python
    numpy
    pkg-config
  ];

  buildInputs = lib.optionals (!stdenv.hostPlatform.isDarwin) [
    blas
    lapack
  ];

  dependencies = [
    numpy
    scipy
  ];

  pythonImportsCheck = [ "scs" ];

  meta = {
    description = "Python interface for SCS: Splitting Conic Solver";
    inherit (pkgs.scs.meta) homepage;
    downloadPage = "https://github.com/bodono/scs-python";
    license = lib.licenses.mit;
    maintainers = [ ];
  };
})
