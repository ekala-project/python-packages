{
  lib,
  buildPythonPackage,
  fetchPypi,
  # build-system
  setuptools,
}:

buildPythonPackage rec {
  pname = "docx2txt";
  version = "0.9";
  pyproject = true;

  src = fetchPypi {
    inherit pname version;
    hash = "sha256-GAE/YimxSQkCixmqe/T489bkYy17CJqyn38KTR9mDig=";
  };

  build-system = [ setuptools ];

  pythonImportsCheck = [ "docx2txt" ];

  meta = {
    description = "Pure python-based utility to extract text and images from docx files";
    homepage = "https://github.com/ankushshah89/python-docx2txt";
    license = lib.licenses.mit;
  };
}
