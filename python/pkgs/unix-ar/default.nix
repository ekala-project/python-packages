{
  lib,
  buildPythonPackage,
  fetchPypi,
}:

buildPythonPackage (finalAttrs: {
  pname = "unix-ar";
  version = "0.2.1";
  format = "wheel";

  src = fetchPypi {
    inherit (finalAttrs) version;
    format = "wheel";
    pname = "unix_ar";
    hash = "sha256-Kstxi8Ewi/gOW52iYU2CQswv475M2LL9Rxm84Ymq/PE=";
  };

  meta = {
    description = "AR file handling for Python (including .deb files)";
    homepage = "https://github.com/getninjas/unix_ar";
    license = lib.licenses.bsd3;
    platforms = with lib.platforms; linux ++ darwin;
  };
})
