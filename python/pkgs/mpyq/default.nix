{
  buildPythonPackage,
  lib,
  fetchPypi,
  # build-system
  setuptools,
}:

buildPythonPackage (finalAttrs: {
  pname = "mpyq";
  version = "0.2.5";
  pyproject = true;

  src = fetchPypi {
    inherit (finalAttrs) pname version;
    sha256 = "01q0xh2fy3zzsrfr45d2ypj4whs7s060cy1rnprg6sg55fbgbaih";
  };

  build-system = [ setuptools ];

  meta = {
    description = "Python library for extracting MPQ (MoPaQ) files";
    mainProgram = "mpyq";
    homepage = "https://github.com/eagleflo/mpyq";
    license = lib.licenses.bsd2;
  };
})
