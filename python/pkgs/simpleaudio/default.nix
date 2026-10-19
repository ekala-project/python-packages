{
  alsa-lib,
  buildPythonPackage,
  fetchFromGitHub,
  # build-system
  setuptools,
  lib,
}:

buildPythonPackage rec {
  pname = "simpleaudio";
  version = "1.0.4";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "hamiltron";
    repo = "py-simple-audio";
    tag = version;
    sha256 = "12nypzb1m14yip4zrbzin5jc5awyp1d5md5y40g5anj4phb4hx1i";
  };

  build-system = [ setuptools ];

  patches = [ ./python312-fix.patch ];

  buildInputs = [ alsa-lib ];

  meta = {
    homepage = "https://github.com/hamiltron/py-simple-audio";
    description = "Simple audio playback Python extension - cross-platform, asynchronous, dependency-free";
    license = lib.licenses.mit;
  };
}
