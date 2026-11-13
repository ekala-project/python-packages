{
  lib,
  buildPythonPackage,
  pkgs,
  stdenv,
  setuptools,
}:

let
  # TODO: remove once corepkgs' capstone sets CAPSTONE_BUILD_SHARED_LIBS;
  # capstone 6 ignores BUILD_SHARED_LIBS and only builds a static library,
  # but the ctypes-based bindings need libcapstone.so.
  capstone = pkgs.capstone.overrideAttrs (old: {
    cmakeEntries = (old.cmakeEntries or { }) // {
      CAPSTONE_BUILD_SHARED_LIBS = true;
    };
  });
in
buildPythonPackage (finalAttrs: {
  pname = "capstone";
  version = lib.getVersion capstone;
  pyproject = true;

  src = capstone.src;

  build-system = [ setuptools ];
  sourceRoot = "${finalAttrs.src.name}/bindings/python";

  postPatch = ''
    ln -s ${capstone}/lib/libcapstone${stdenv.targetPlatform.extensions.sharedLibrary} prebuilt/
    touch prebuilt/libcapstone${stdenv.targetPlatform.extensions.staticLibrary}
    substituteInPlace setup.py --replace manylinux1 manylinux2014
  '';

  setupPyBuildFlags = lib.optionals (stdenv.hostPlatform.isDarwin && stdenv.hostPlatform.isAarch64) [
    "--plat-name"
    "macosx_11_0"
  ];

  dependencies = [ setuptools ];

  pythonImportsCheck = [ "capstone" ];

  meta = {
    homepage = "http://www.capstone-engine.org/";
    license = lib.licenses.bsdOriginal;
    description = "Python bindings for Capstone disassembly engine";
  };
})
