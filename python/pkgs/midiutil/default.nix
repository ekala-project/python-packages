{
  lib,
  buildPythonPackage,
  fetchPypi,
  # build-system
  setuptools,
}:

buildPythonPackage (finalAttrs: {
  pname = "midiutil";
  version = "1.2.1";
  pyproject = true;

  src = fetchPypi {
    pname = "MIDIUtil";
    inherit (finalAttrs) version;
    sha256 = "02m9sqv36zrzgz5zg2w9qmz8snzlm27yg3ways2hgipgs4xriykr";
  };

  build-system = [ setuptools ];

  meta = {
    homepage = "https://github.com/MarkCWirt/MIDIUtil";
    description = "Pure python library for creating multi-track MIDI files";
    license = lib.licenses.mit;
  };
})
