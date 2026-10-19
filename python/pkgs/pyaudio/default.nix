{
  lib,
  buildPythonPackage,
  fetchPypi,
  # build-system
  setuptools,
  isPyPy,
  pkgs,
}:

buildPythonPackage (finalAttrs: {
  pname = "pyaudio";
  version = "0.2.14";
  pyproject = true;
  disabled = isPyPy;

  src = fetchPypi {
    pname = "PyAudio";
    inherit (finalAttrs) version;
    hash = "sha256-eN//OHm0mU0fT8ZIVkald1XG7jwZZHpJH3kKCJW9L4c=";
  };

  build-system = [ setuptools ];

  buildInputs = [ pkgs.portaudio ];

  meta = {
    description = "Python bindings for PortAudio";
    homepage = "https://people.csail.mit.edu/hubert/pyaudio/";
    license = lib.licenses.mit;
  };
})
