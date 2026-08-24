{ lib
, stdenv
, gcc13Stdenv
, buildPythonPackage
, fetchFromGitHub
, # nativeBuildInputs
  cmake
, ninja
, # build-system
  pathspec
, pyproject-metadata
, scikit-build-core
, # dependencies
  diskcache
, jinja2
, numpy
, typing-extensions
, llama-cpp-python
, config
, cudaSupport ? config.cudaSupport
, cudaPackages ? { }
,
}:
let
  stdenvTarget = if cudaSupport then gcc13Stdenv else stdenv;
in
buildPythonPackage.override { stdenv = stdenvTarget; } rec {
  pname = "llama-cpp-python";
  version = "0.3.23";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "abetlen";
    repo = "llama-cpp-python";
    tag = "v${version}";
    hash = "sha256-LqSgohfTv02RNZGMjKG0Pq2vHuIX+446uI2Q3KRmnzI=";
    fetchSubmodules = true;
  };

  dontUseCmakeConfigure = true;
  cmakeFlags = [
    # Set GGML_NATIVE=off. Otherwise, cmake attempts to build with
    # -march=native* which is either a no-op (if cc-wrapper is able to ignore
    # it), or an attempt to build a non-reproducible binary.
    #
    # This issue was spotted when cmake rules appended feature modifiers to
    # -mcpu, breaking linux build as follows:
    #
    # cc1: error: unknown value ‘native+nodotprod+noi8mm+nosve’ for ‘-mcpu’
    (lib.cmakeBool "GGML_NATIVE" false)
  ];
  enableParallelBuilding = true;

  nativeBuildInputs = [
    cmake
    ninja
  ];
  build-system = [
    pathspec
    pyproject-metadata
    scikit-build-core
  ];

  buildInputs = lib.optionals cudaSupport (
    with cudaPackages;
    [
      cuda_cudart # cuda_runtime.h
      cccl # <thrust/*>
      libcublas # cublas_v2.h
    ]
  );

  dependencies = [
    diskcache
    jinja2
    numpy
    typing-extensions
  ];

  pythonImportsCheck = lib.optionals (!cudaSupport) [
    # `libllama.so` is loaded at import time, and failing when cudaSupport is enabled as the cuda
    # driver is missing in the sandbox:
    # RuntimeError: Failed to load shared library '/nix/store/...-python3.13-llama-cpp-python-0.3.16/lib/python3.13/site-packages/llama_cpp/lib/libllama.so':
    # libcuda.so.1: cannot open shared object file: No such file or directory
    "llama_cpp"
  ];

  meta = {
    description = "Python bindings for llama.cpp";
    homepage = "https://github.com/abetlen/llama-cpp-python";
    license = lib.licenses.mit;
    maintainers = [ ];
  };
}
