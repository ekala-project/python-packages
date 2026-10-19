{
  alsa-lib,
  buildPythonPackage,
  fetchPypi,
  # build-system
  setuptools,
  lib,
}:

buildPythonPackage (finalAttrs: {
  pname = "pyalsaaudio";
  version = "0.11.0";
  pyproject = true;

  src = fetchPypi {
    inherit (finalAttrs) pname version;
    hash = "sha256-p4qdyjNSSyyQZLNOIfWrh0JyMTzzJKmndZLzlqXg/dw=";
  };

  build-system = [ setuptools ];

  buildInputs = [
    alsa-lib
  ];

  pythonImportsCheck = [ "alsaaudio" ];

  meta = {
    description = "ALSA wrappers for Python";
    homepage = "https://github.com/larsimmisch/pyalsaaudio";
    license = lib.licenses.psfl;
  };
})
