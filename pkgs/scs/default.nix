{
  lib,
  stdenv,
  fetchFromGitHub,
  blas,
  lapack,
  gfortran,
}:

assert (!blas.isILP64) && (!lapack.isILP64);

stdenv.mkDerivation (finalAttrs: {
  pname = "scs";
  version = "3.2.11";

  src = fetchFromGitHub {
    owner = "cvxgrp";
    repo = "scs";
    tag = finalAttrs.version;
    hash = "sha256-hF5BxCLscyUmNXIVFIAAjY0GDbcH7WjODC4116aQfIs=";
  };

  # Actually link and add libgfortran to the rpath
  postPatch = ''
    substituteInPlace scs.mk \
      --replace-fail "# -lgfortran" "-lgfortran" \
      --replace-fail "gcc" "cc"
  '';

  buildInputs = [
    blas
    lapack
    gfortran.cc.lib
  ];

  installPhase = ''
    runHook preInstall
    mkdir -p $out/lib
    cp -r include $out/
    cp out/*.a out/*.so out/*.dylib $out/lib/ 2>/dev/null || true
    runHook postInstall
  '';

  meta = {
    description = "Splitting Conic Solver";
    homepage = "https://github.com/cvxgrp/scs";
    license = lib.licenses.mit;
    platforms = lib.platforms.all;
    maintainers = [ ];
  };
})
