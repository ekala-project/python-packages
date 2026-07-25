{
  lib,
  buildPythonPackage,
  fetchFromGitHub,
  replaceVars,
  applyPatches,

  # build-system
  cmake,
  ninja,
  scikit-build-core,
  pybind11,
  setuptools-scm,

  # dependencies
  jinja2,
  joblib,
  numpy,
  scipy,
}:

let
  qdldl_src = fetchFromGitHub {
    owner = "osqp";
    repo = "qdldl";
    tag = "v0.1.8";
    hash = "sha256-qCeOs4UjZLuqlbiLgp6BMxvw4niduCPDOOqFt05zi2E=";
  };

  osqp_src = applyPatches {
    src = fetchFromGitHub {
      owner = "osqp";
      repo = "osqp";
      tag = "v1.0.0";
      hash = "sha256-BOAytzJzHcggncQzeDrXwJOq8B3doWERJ6CKIVg1yJY=";
    };
    patches = [
      (replaceVars ./dont-fetch-qdldl.patch {
        inherit qdldl_src;
      })
    ];
  };
in

buildPythonPackage (finalAttrs: {
  pname = "osqp";
  version = "1.1.3";
  pyproject = true;
  __structuredAttrs = true;

  src = fetchFromGitHub {
    owner = "osqp";
    repo = "osqp-python";
    tag = "v${finalAttrs.version}";
    hash = "sha256-xK7ljAwVwsmj84s5yxeU64nwT6N/Ec58aYjiUUOr4Ig=";
  };

  patches = [
    (replaceVars ./dont-fetch-osqp.patch {
      inherit osqp_src;
    })
  ];

  build-system = [
    cmake
    ninja
    pybind11
    scikit-build-core
    setuptools-scm
  ];
  dontUseCmakeConfigure = true;

  dependencies = [
    jinja2
    joblib
    numpy
    scipy
  ];
  pythonImportsCheck = [ "osqp" ];
  meta = {
    description = "Operator Splitting QP Solver";
    longDescription = ''
      Numerical optimization package for solving problems in the form
        minimize        0.5 x' P x + q' x
        subject to      l <= A x <= u

      where x in R^n is the optimization variable
    '';
    homepage = "https://osqp.org/";
    downloadPage = "https://github.com/oxfordcontrol/osqp-python/releases";
    license = lib.licenses.asl20;
    maintainers = [ ];
  };
})
