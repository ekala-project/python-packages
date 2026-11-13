{
  lib,
  fetchPypi,
  buildPythonPackage,
  setuptools,
}:

buildPythonPackage (finalAttrs: {
  pname = "css-parser";
  version = "1.1.1";
  pyproject = true;

  src = fetchPypi {
    pname = "css_parser";
    inherit (finalAttrs) version;
    hash = "sha256-k8f7CM8W1Fu7i5ZLT0iZpOs22b5v/vF/ma0oD0A0s2w=";
  };

  build-system = [ setuptools ];

  pythonImportsCheck = [ "css_parser" ];

  meta = {
    homepage = "https://github.com/ebook-utils/css-parser";
    description = "CSS Cascading Style Sheets library for Python";
    license = lib.licenses.lgpl3Plus;
  };
})
