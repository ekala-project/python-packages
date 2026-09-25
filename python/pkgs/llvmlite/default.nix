{
  lib,
  fetchFromGitHub,
  buildPythonPackage,
  isPyPy,

  setuptools,

  cmake,
  ninja,

  llvmPackages,
  libxml2,

  withStaticLLVM ? true,
}:

let
  llvm = llvmPackages.llvm;
in

buildPythonPackage rec {
  pname = "llvmlite";
  version = "0.49.0";
  pyproject = true;

  disabled = isPyPy;

  src = fetchFromGitHub {
    owner = "numba";
    repo = "llvmlite";
    tag = "v${version}";
    hash = "sha256-AUte9llrcPl2z4ipkZ3PGeryDveZ9vj5oaBQtzGaT+w=";
  };

  postPatch = ''
    substituteInPlace ffi/CMakeLists.txt \
      --replace-fail \
        "set(LLVMLITE_SUPPORTED_LLVM_VERSION_DEFAULT 22)" \
        "set(LLVMLITE_SUPPORTED_LLVM_VERSION_DEFAULT 21)"
  '';

  build-system = [ setuptools ];

  nativeBuildInputs = [
    cmake
    ninja
  ];

  buildInputs = [ llvm ] ++ lib.optionals withStaticLLVM [ libxml2.dev ];

  dontUseCmakeConfigure = true;

  env.LLVMLITE_SHARED = !withStaticLLVM;

  passthru = lib.optionalAttrs (!withStaticLLVM) { inherit llvm; };

  meta = {
    description = "Lightweight LLVM python binding for writing JIT compilers";
    downloadPage = "https://github.com/numba/llvmlite";
    homepage = "http://llvmlite.pydata.org/";
    license = lib.licenses.bsd2;
  };
}
