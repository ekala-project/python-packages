{
  lib,
  fetchPypi,
  buildPythonPackage,
  setuptools,
}:

buildPythonPackage (finalAttrs: {
  pname = "css-parser";
  version = "1.0.10";
  pyproject = true;

  src = fetchPypi {
    inherit (finalAttrs) pname version;
    hash = "sha256-vx6XKtMzROkyBpZPtM2QjZ3e+fzQwB+pPg1zRnU5Q2M=";
  };

  build-system = [ setuptools ];

  pythonImportsCheck = [ "css_parser" ];

  meta = {
    homepage = "https://github.com/ebook-utils/css-parser";
    description = "CSS Cascading Style Sheets library for Python";
    license = lib.licenses.lgpl3Plus;
  };
})
