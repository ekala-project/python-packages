{
  lib,
  fetchPypi,
  buildPythonPackage,
  setuptools,
}:

buildPythonPackage rec {
  pname = "pymupdf_fonts";
  version = "1.0.5";
  pyproject = true;

  src = fetchPypi {
    inherit pname version;
    hash = "sha256-rBLj7Er/o16aCsopE170HCO9vldYwzVdrCNphjCea8Y=";
  };

  build-system = [ setuptools ];

  pythonImportsCheck = [ "pymupdf_fonts" ];

  meta = {
    description = "Collection of optional fonts for PyMuPDF";
    homepage = "https://github.com/pymupdf/pymupdf-fonts";
    license = lib.licenses.ofl;
  };
}
