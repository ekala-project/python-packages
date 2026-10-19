{
  lib,
  buildPythonPackage,
  fetchPypi,
  # build-system
  setuptools,
  setuptools-scm,
}:

buildPythonPackage (finalAttrs: {
  pname = "ujson";
  version = "6.0.0";
  pyproject = true;

  src = fetchPypi {
    inherit (finalAttrs) pname version;
    hash = "sha256-gOIzk/63B1guCtSVw5ekR3tkbQgJTS32T3MW+fr9iq4=";
  };

  build-system = [ setuptools ];

  nativeBuildInputs = [ setuptools-scm ];

  pythonImportsCheck = [ "ujson" ];

  meta = {
    description = "Ultra fast JSON encoder and decoder";
    homepage = "https://github.com/ultrajson/ultrajson";
    license = lib.licenses.bsd3;
  };
})
