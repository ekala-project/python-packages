{
  lib,
  buildPythonPackage,
  fetchFromGitHub,
  setuptools,
}:

buildPythonPackage rec {
  pname = "brotli";
  version = "1.2.0";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "google";
    repo = "brotli";
    tag = "v${version}";
    hash = "sha256-kl8ZHt71v17QR2bDP+ad/5uixf+GStEPLQ5ooFoC5i8=";
  };

  build-system = [
    setuptools
  ];

  # only returns information how to really build
  dontConfigure = true;

  pythonImportsCheck = [ "brotli" ];

  meta = {
    homepage = "https://github.com/google/brotli";
    description = "Generic-purpose lossless compression algorithm";
    license = lib.licenses.mit;
  };
}
