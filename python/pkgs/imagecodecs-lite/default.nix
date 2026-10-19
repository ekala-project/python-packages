{
  lib,
  fetchPypi,
  # build-system
  setuptools,
  buildPythonPackage,
  pytest,
  numpy,
  cython,
}:

buildPythonPackage (finalAttrs: {
  pname = "imagecodecs-lite";
  version = "2019.12.3";
  pyproject = true;

  src = fetchPypi {
    inherit (finalAttrs) pname version;
    sha256 = "0s4xb17qd7vimc46rafbjnibj4sf0lnv8cwl22k1h6zb7jhqmlcm";
  };

  build-system = [ setuptools ];

  nativeBuildInputs = [ cython ];

  nativeCheckInputs = [ pytest ];

  dependencies = [ numpy ];

  checkPhase = ''
    pytest
  '';

  meta = {
    description = "Block-oriented, in-memory buffer transformation, compression, and decompression functions";
    homepage = "https://www.lfd.uci.edu/~gohlke/";
    license = lib.licenses.bsd3;
  };
})
