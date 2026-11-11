{
  lib,
  buildPythonPackage,
  fetchPypi,
  # build-system
  setuptools,
  isPy3k,
}:

buildPythonPackage (finalAttrs: {
  pname = "pyx";
  version = "0.18";
  pyproject = true;
  disabled = !isPy3k;

  src = fetchPypi {
    inherit (finalAttrs) pname version;
    hash = "sha256-lm2mtRhuBv04ScIQ2uksiOEgJ5wLvs/gO9o/dj6S18w=";
  };

  build-system = [ setuptools ];

  # No tests in archive

  meta = {
    description = "Python package for the generation of PostScript, PDF, and SVG files";
    homepage = "https://pyx.sourceforge.net/";
    license = lib.licenses.gpl2;
  };
})
