{
  autoPatchelfHook,
  buildPythonPackage,
  fetchPypi,
  lib,
  ml-dtypes,
  numpy,
  python,
  stdenv,
}:

let
  pythonVersionNoDot = builtins.replaceStrings [ "." ] [ "" ] python.pythonVersion;
  systemToPlatform = {
    "aarch64-linux" = "manylinux_2_27_aarch64.manylinux_2_28_aarch64";
    "x86_64-linux" = "manylinux_2_27_x86_64.manylinux_2_28_x86_64";
    "aarch64-darwin" = "macosx_11_0_arm64";
  };
  hashes = {
    "311-x86_64-linux" = "sha256-NkoWesobJO64lh9NtzIOjEi+hSL+VPMv6iN9AVHIcXY=";
    "312-x86_64-linux" = "sha256-hEDY9bdyH1GidNcZDXY2QKSKEbVvpI//pcL8AJGSVGo=";
    "313-x86_64-linux" = "sha256-aUhCbvB157kG+d8dJ6+KyKrMKiCAdi4aUwBJb84JzH4=";
    "314-x86_64-linux" = "sha256-p2Z7Mnq/yo9wpdi+wIyx0lVqCpiY56juCCu7U58y5Ms=";
    "311-aarch64-linux" = "sha256-krcjY1wmkDQxFYx+nezkw1Mdsmfj5HalbdL8SI3VueI=";
    "312-aarch64-linux" = "sha256-V20KR8CMAI05iu41lZwf9p7ergmCxr0yZM5qMV+KO5Y=";
    "313-aarch64-linux" = "sha256-4NOeUdzARqL0Wxf4VMqvZYO/L8majqjVSXGKcbm68cw=";
    "314-aarch64-linux" = "sha256-Y2qbT+ZqBJ4tJz9NuZMqUYvC265oUXZ001MBC/II6J4=";
    "311-aarch64-darwin" = "sha256-KbVrHDZ2hzxg2bjQ9XG25qDGT01Ct52YSvM06RS5/FY=";
    "312-aarch64-darwin" = "sha256-vadLEVjyLFkw3FnzeLGjQOZci3niti2k7M0+95ZkasA=";
    "313-aarch64-darwin" = "sha256-4E2bDLDhlirMon/JeGwabPp2ti7yG2I6yBVFyIIFoMY=";
    "314-aarch64-darwin" = "sha256-+cwrtDmKqgsVXJIFUov25ftjcgkmxrZVXRpboB2dn7A=";
  };
in
buildPythonPackage (finalAttrs: {
  pname = "tensorstore";
  version = "0.1.86";
  format = "wheel";

  # The source build involves some wonky Bazel stuff.
  src = fetchPypi {
    inherit (finalAttrs) pname version;
    format = "wheel";
    python = "cp${pythonVersionNoDot}";
    abi = "cp${pythonVersionNoDot}";
    dist = "cp${pythonVersionNoDot}";
    platform = systemToPlatform.${stdenv.system} or (throw "unsupported system");
    hash =
      hashes."${pythonVersionNoDot}-${stdenv.system}"
        or (throw "unsupported system/python version combination");
  };

  nativeBuildInputs = lib.optionals stdenv.hostPlatform.isLinux [ autoPatchelfHook ];

  dependencies = [
    ml-dtypes
    numpy
  ];

  pythonImportsCheck = [ "tensorstore" ];

  meta = {
    description = "Library for reading and writing large multi-dimensional arrays";
    homepage = "https://google.github.io/tensorstore";
    license = lib.licenses.asl20;
    sourceProvenance = [ lib.sourceTypes.binaryNativeCode ];
  };
})
