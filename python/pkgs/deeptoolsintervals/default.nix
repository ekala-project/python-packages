{
  lib,
  buildPythonPackage,
  fetchPypi,
  # build-system
  setuptools,
  zlib,
  xz,
}:

buildPythonPackage (finalAttrs: {
  pname = "deeptoolsintervals";
  version = "0.1.9";
  pyproject = true;

  src = fetchPypi {
    inherit (finalAttrs) pname version;
    sha256 = "1xnl80nblysj6dylj4683wgrfa425rkx4dp5k65hvwdns9pw753x";
  };

  build-system = [ setuptools ];

  buildInputs = [
    zlib
    xz
  ];

  meta = {
    homepage = "https://deeptools.readthedocs.io/en/develop";
    description = "Helper library for deeptools";
    license = lib.licenses.mit;
  };
})
