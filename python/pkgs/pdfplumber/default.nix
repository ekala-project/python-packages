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
  version = "0.11.10";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "jsvine";
    repo = "pdfplumber";
    tag = "v${version}";
    hash = "sha256-0fdH8SKU8ude43x7tsWxeGFQeSCYrTGTELG6SimloLQ=";
  };

  build-system = [ setuptools ];

  dependencies = [
    pdfminer-six
    pillow
    pypdfium2
  ];
  pythonRelaxDeps = [ "pdfminer.six" "pypdfium2" ];
  pythonImportsCheck = [ "pdfplumber" ];

  meta = {
    description = "Plumb a PDF for detailed information about each char, rectangle, line, et cetera — and easily extract text and tables";
    mainProgram = "pdfplumber";
    homepage = "https://github.com/jsvine/pdfplumber";
    license = lib.licenses.mit;
    maintainers = [ ];
  };
}
