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
  version = "4.0.0";
  pyproject = true;

  src = fetchPypi {
    inherit (finalAttrs) pname version;
    sha256 = "sha256-bJSfAbsP6kVgzCPkuLAXGIZH0i+ZpgSn7T0J9y9D5jQ=";
  };

  build-system = [ setuptools ];

  buildInputs = [ poppler ];

  meta = {
    description = "Simple PDF text extraction";
    homepage = "https://github.com/jalan/pdftotext";
    license = lib.licenses.mit;
  };
})
