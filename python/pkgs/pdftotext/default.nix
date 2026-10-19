{
  lib,
  buildPythonPackage,
  fetchPypi,
  # build-system
  setuptools,
  poppler,
}:

buildPythonPackage (finalAttrs: {
  pname = "pdftotext";
  version = "3.0.0";
  pyproject = true;

  src = fetchPypi {
    inherit (finalAttrs) pname version;
    sha256 = "sha256-w2UrGRVOFFUVqL+pU/xhNjOO2SM3vcy7U/4NiAE7Gqo=";
  };

  build-system = [ setuptools ];

  buildInputs = [ poppler ];

  meta = {
    description = "Simple PDF text extraction";
    homepage = "https://github.com/jalan/pdftotext";
    license = lib.licenses.mit;
  };
})
