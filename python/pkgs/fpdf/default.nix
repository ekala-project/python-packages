{
  lib,
  fetchPypi,
  buildPythonPackage,
  setuptools,
}:

buildPythonPackage (finalAttrs: {
  pname = "fpdf";
  version = "1.7.2";
  pyproject = true;

  src = fetchPypi {
    inherit (finalAttrs) pname version;
    hash = "sha256-ElhAeDKJ59ElUrHoaraSw3Mi56ZblqmeDqhsygQbZ3k=";
  };

  build-system = [ setuptools ];

  pythonImportsCheck = [ "fpdf" ];

  meta = {
    description = "Simple PDF generation for Python";
    homepage = "https://github.com/reingart/pyfpdf";
    license = lib.licenses.lgpl3;
  };
})
