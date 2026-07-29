{
  pkgs,
  lib,
  buildPythonPackage,
  fetchFromGitHub,
  setuptools,
  pdfminer-six,
  pillow,
  pypdfium2,
}:

buildPythonPackage rec {
  pname = "pdfplumber";
  version = "0.11.9";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "jsvine";
    repo = "pdfplumber";
    tag = "v${version}";
    hash = "sha256-vOtr+9qRpd+VXUpVL2whflbA7Gchd4yuA47FBl5BYfE=";
  };

  build-system = [ setuptools ];

  dependencies = [
    pdfminer-six
    pillow
    pypdfium2
  ];
  pythonRelaxDeps = [ "pdfminer.six" ];
  pythonImportsCheck = [ "pdfplumber" ];

  meta = {
    description = "Plumb a PDF for detailed information about each char, rectangle, line, et cetera — and easily extract text and tables";
    mainProgram = "pdfplumber";
    homepage = "https://github.com/jsvine/pdfplumber";
    license = lib.licenses.mit;
    maintainers = [ ];
  };
}
