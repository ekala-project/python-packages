{
  lib,
  buildPythonPackage,
  pkgs,
  stdenv,
  setuptools,
}:

buildPythonPackage rec {
  pname = "capstone";
  version = lib.getVersion pkgs.capstone;
  format = "setuptools";

  src = pkgs.capstone.src;
  sourceRoot = "${src.name}/bindings/python";

  postPatch = ''
    ln -s ${pkgs.capstone}/lib/libcapstone${stdenv.targetPlatform.extensions.sharedLibrary} prebuilt/
    touch prebuilt/libcapstone${stdenv.targetPlatform.extensions.staticLibrary}
    substituteInPlace setup.py --replace manylinux1 manylinux2014
  '';

  setupPyBuildFlags = lib.optionals (stdenv.hostPlatform.isDarwin && stdenv.hostPlatform.isAarch64) [
    "--plat-name"
    "macosx_11_0"
  ];

  propagatedBuildInputs = [ setuptools ];

  pythonImportsCheck = [ "capstone" ];

  meta = {
    homepage = "http://www.capstone-engine.org/";
    license = lib.licenses.bsdOriginal;
    description = "Python bindings for Capstone disassembly engine";
    maintainers = [ ];
  };
}
