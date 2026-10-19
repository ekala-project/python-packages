{
  lib,
  buildPythonPackage,
  pystemmer,
  fetchPypi,
  # build-system
  setuptools,
}:

buildPythonPackage (finalAttrs: {
  pname = "snowballstemmer";
  version = "3.1.1";
  pyproject = true;

  src = fetchPypi {
    inherit (finalAttrs) pname version;
    sha256 = "sha256-4Hu8VKDXmP5gEKEjmEIuYqi/u6lcOU/QlW71jLTT4mA=";
  };

  build-system = [ setuptools ];

  # No tests included

  dependencies = [ pystemmer ];

  meta = {
    description = "16 stemmer algorithms (15 + Poerter English stemmer) generated from Snowball algorithms";
    homepage = "http://sigal.saimon.org/en/latest/index.html";
    license = lib.licenses.bsd3;
    platforms = lib.platforms.unix;
  };
})
