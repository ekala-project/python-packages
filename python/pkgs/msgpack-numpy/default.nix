{
  lib,
  buildPythonPackage,
  fetchPypi,
  # build-system
  setuptools,
  cython,
  msgpack,
  numpy,
  python,
}:

buildPythonPackage (finalAttrs: {
  pname = "msgpack-numpy";
  version = "0.4.8";
  pyproject = true;

  src = fetchPypi {
    inherit (finalAttrs) pname version;
    hash = "sha256-xmfTGAUTQi+cdUW+XuxdKW3Ls1fgb3LtOcxoN5dVbmk=";
  };

  build-system = [ setuptools ];

  buildInputs = [ cython ];

  dependencies = [
    msgpack
    numpy
  ];

  checkPhase = ''
    ${python.interpreter} msgpack_numpy.py
  '';

  meta = {
    description = "Numpy data type serialization using msgpack";
    homepage = "https://github.com/lebedov/msgpack-numpy";
    license = lib.licenses.bsd3;
  };
})
