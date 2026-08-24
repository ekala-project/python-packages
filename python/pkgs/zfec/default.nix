{
  lib,
  buildPythonPackage,
  fetchPypi,
  pyutil,
  setuptools,
}:

buildPythonPackage (finalAttrs: {
  pname = "zfec";
  version = "1.6.0.0";
  pyproject = true;

  src = fetchPypi {
    inherit (finalAttrs) pname version;
    hash = "sha256-xaGGHCU7USaYwuczrk2D9eLW6myIG32+ETNLaU51WgA=";
  };

  nativeBuildInputs = [ setuptools ];

  propagatedBuildInputs = [ pyutil ];

  meta = {
    homepage = "https://github.com/tahoe-lafs/zfec";
    description = "Fast erasure codec which can be used with the command-line, C, Python, or Haskell";
    license = lib.licenses.gpl2Plus;
    maintainers = [ ];
  };
})
