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
  version = "0.48.0";
  pyproject = true;

  disabled = isPyPy;

  src = fetchFromGitHub {
    owner = "numba";
    repo = "llvmlite";
    tag = "v${version}";
    hash = "sha256-qFly3Thx0jkCHy6r8+VWuGROUj910oHBEQFMZlAX1aw=";
  };

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
    maintainers = [ ];
  };
}
