{
  lib,
  stdenv,
  buildPythonPackage,
  pkgs,
  # build-system
  setuptools,
}:

buildPythonPackage {
  pyproject = true;
  inherit (pkgs.file) pname version src;

  build-system = [ setuptools ];

  patchPhase = ''
    substituteInPlace python/magic.py --replace "find_library('magic')" "'${pkgs.file}/lib/libmagic${stdenv.hostPlatform.extensions.sharedLibrary}'"
  '';

  buildInputs = [ pkgs.file ];

  preConfigure = "cd python";

  # No test suite

  meta = {
    description = "Python wrapper around libmagic";
    homepage = "http://www.darwinsys.com/file/";
    license = lib.licenses.lgpl2;
  };
}
