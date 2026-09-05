{
  lib,
  buildPythonPackage,
  fetchFromGitHub,

  # build-system
  cmake,
  cython,
  ninja,
  scikit-build-core,
  setuptools-scm,

  # dependencies
  typing-extensions,

  # tests
  numpy,
}:

buildPythonPackage (finalAttrs: {
  pname = "apache-tvm-ffi";
  version = "0.1.13";
  pyproject = true;
  __structuredAttrs = true;

  src = fetchFromGitHub {
    owner = "apache";
    repo = "tvm-ffi";
    tag = "v${finalAttrs.version}";
    fetchSubmodules = true;
    hash = "sha256-GerOAPpCMQpVrk0H/aQpJ2aGoYaNIQDw/Cx78AaNjFE=";
  };

  postPatch = ''
    substituteInPlace pyproject.toml \
      --replace-fail '"cython>=3.2.8"' '"cython>=3.0.0"'
  '';

  build-system = [
    cmake
    cython
    ninja
    scikit-build-core
    setuptools-scm
  ];
  dontUseCmakeConfigure = true;

  dependencies = [
    typing-extensions
  ];

  optional-dependencies = {
    cpp = [
      ninja
    ];
  };

  pythonImportsCheck = [ "tvm_ffi" ];
  meta = {
    description = "Open ABI and FFI for Machine Learning Systems";
    homepage = "https://github.com/apache/tvm-ffi";
    license = lib.licenses.asl20;
    maintainers = [ ];
  };
})
